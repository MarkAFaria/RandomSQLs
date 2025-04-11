SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/******************************************************************************
* Name:		usp_load_person_id
*
* Version:	1.0
*
* Author:	Preetish (preetish@bu.edu)
*
* Date:		04/15/2022
*
*
* Purpose:	Load the person ID. 
*
* Usage:
*    EXEC [emr_dm].[usp_load_person_id];
*
* Modification History:
* ---------------------
*    Date       Author	  Nbr	Description
* ---------- ------------ ---	---------------------------------------------
*
* 04/15/2021  Preetish    0		First created

******************************************************************************/

CREATE PROCEDURE [emr_dm].[usp_load_person_id] 
AS
BEGIN

	SET NOCOUNT ON;    --suppress row count messages if not needed
	SET XACT_ABORT ON; --ensure transaction is rolled back immediately after timeout

/******************************************************************************
*	Declarations
******************************************************************************/

	DECLARE @ErrorProcedure   VARCHAR(250);
	DECLARE @ErrorMessage     VARCHAR(500);
    DECLARE @ErrorSeverity    INT;
    DECLARE @ErrorState       INT;
	DECLARE @ErrorNumber      INT;
	DECLARE @ErrorLine        INT;

	DECLARE @log_message      NVARCHAR(500) = NULL
	DECLARE @InsertRowCount   INT;
	DECLARE @UpdateRowCount   INT;

	DECLARE @LoadDate         DATETIME = GETDATE();
	DECLARE @Snapshot_Date    DATETIME = GETDATE();

	BEGIN TRY
	BEGIN TRANSACTION;

	SET @log_message = 'Starting Person ID load.'
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;


    SET @Snapshot_Date = CAST(GETDATE() AS DATE);

	SET @log_message = '..Merging EH Person_ID in [emr_dm].[dim_person_id].'				  
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;



	MERGE [emr_dm].[dim_person_id] AS target
		USING [emr_dm].[dim_eh_employee] AS source
		ON (target.uid = source.bu_uid)
		WHEN MATCHED
			THEN
			UPDATE
			SET target.emr_person_id        = source.eh_patient_id,
				target.person_type		    = 'E',
				target.person_id            = CONVERT(VARCHAR(32), HashBytes('MD5', bu_uid), 2),
				target.modified_date        = @LoadDate
		WHEN NOT MATCHED BY TARGET
			THEN
			INSERT (uid, emr_person_id,
					person_type, person_id,
					created_date, modified_date)
			VALUES (source.bu_uid, source.eh_patient_id,
					'E', CONVERT(VARCHAR(32), HashBytes('MD5', bu_uid), 2),
					@LoadDate, @LoadDate);


    SET @InsertRowCount = @@ROWCOUNT

	SET @log_message = FORMATMESSAGE('Inserted [%d] records into %s table.', @InsertRowCount, '[emr_dm].[dim_person_id]' )
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;


	SET @log_message = '..Merging PnC Person_ID in [emr_dm].[dim_person_id].'				  
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;

	MERGE [emr_dm].[dim_person_id] AS target
		USING [emr_dm].[dim_pnc_student] AS source
		ON (target.uid = source.bu_uid)
		WHEN MATCHED
			THEN
			UPDATE
			SET target.emr_person_id        = source.pnc_patient_id,
				target.person_type		    = 'S',
				target.person_id            = CONVERT(VARCHAR(32), HashBytes('MD5', bu_uid), 2),
				target.modified_date        = @LoadDate
		WHEN NOT MATCHED BY TARGET
			THEN
			INSERT (uid, emr_person_id,
					person_type, person_id,
					created_date, modified_date)
			VALUES (source.bu_uid, source.pnc_patient_id,
					'S', CONVERT(VARCHAR(32), HashBytes('MD5', bu_uid), 2),
					@LoadDate, @LoadDate);
 
    SET @InsertRowCount = @@ROWCOUNT

	SET @log_message = FORMATMESSAGE('Inserted [%d] records into %s table.', @InsertRowCount, '[emr_dm].[dim_person_id]' )
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;


	SET @log_message = '..Updating barcodes for EH Persons in [emr_dm].[dim_person_id].'				  
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;

	with barcodes as
	(
	select bu_uid as uid, specimen_number as bar_code_number
	  from emr_dm.fact_student_lab_test 
	union
	select bu_uid, labreq_filler_order_id as bar_code_number 
	  from emr_dm.fact_emp_lab_test 
	where labreq_filler_order_id <> '0000-EXTERNAL'
	),
	barcode_list as
	(
	select b.uid, STRING_AGG(cast(bar_code_number as NVARCHAR(MAX)),', ') AS bar_codes
	 from barcodes b
	group by b.uid
	)
	update [emr_dm].[dim_person_id] 
	  set bar_code = bar_codes
	from barcode_list b
	  inner join [emr_dm].[dim_person_id] p
		 on p.uid = b.uid;

    SET @InsertRowCount = @@ROWCOUNT

	SET @log_message = FORMATMESSAGE('Updated [%d] records into %s table.', @InsertRowCount, '[emr_dm].[dim_person_id]' )
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;

	with barcodes as
	(
	select bu_uid as uid, specimen_number as bar_code_number
	  from emr_dm.fact_student_lab_test 
	union
	select bu_uid, labreq_filler_order_id as bar_code_number 
	  from emr_dm.fact_emp_lab_test 
	where labreq_filler_order_id <> '0000-EXTERNAL'
	),
	barcode_list as
	(
	select uid, (select bar_code_number  as barcode_num from barcodes a 
				   where a.uid = b.uid FOR JSON PATH) as bar_codes
	  from barcodes b
	)
	update [emr_dm].[dim_person_id] 
	  set bar_code = bar_codes
	from barcode_list b
	  inner join [emr_dm].[dim_person_id] p
		 on p.uid = b.uid;


	SET @log_message = '..Updating barcodes for PnC Persons in [emr_dm].[dim_person_id].'				  
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;

    SET @InsertRowCount = @@ROWCOUNT

	SET @log_message = FORMATMESSAGE('Updated [%d] records into %s table.', @InsertRowCount, '[emr_dm].[dim_person_id]' )
	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = @log_message;


   	COMMIT TRANSACTION; 


	EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = 'Finished EMR Patient ID data load';

    END TRY

	BEGIN CATCH
		-- Log Errors

		SELECT @ErrorMessage = ERROR_MESSAGE(),
			   @ErrorSeverity = ERROR_SEVERITY(),
			   @ErrorNumber = ERROR_NUMBER(),
			   @ErrorLine = ERROR_LINE(),
			   @ErrorState = ERROR_STATE(),
			   @ErrorProcedure = ERROR_PROCEDURE();

		IF (XACT_STATE()) = -1
		BEGIN
			--PRINT
			--    N'The transaction is in an uncommittable state. ' +
			--    'Rolling back transaction.'
			ROLLBACK TRANSACTION;

		END;
		-- when transaction is active and valid.
		IF (XACT_STATE()) = 1
		BEGIN
			COMMIT TRANSACTION;   
		END;

		
        EXEC [utility].[usp_write_load_log] @object_id = @@PROCID, 
			         @log_message = 'Error loading EMR Patient ID data load';

		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState, -- State.
				   @ErrorNumber,--Number
				   @ErrorLine, --Line Number
				   @ErrorProcedure -- Procedure Name
				  );

	END CATCH;

END
GO

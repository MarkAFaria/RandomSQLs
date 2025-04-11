SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW data_feed.v_fact_student_vaccination
as
/******************************************************************************
* Name:		data_feed.v_fact_student_vaccination
*
* Version:	1.0
*
* Author:	Mark F. (mfaria@bu.edu)
*
* Date:		02/02/2022
*
*
* Purpose:	view of emr_dm.fact_student_vaccination table for Research Computing access via HDR
*
* Usage:
*    EXEC [data_feed].[v_fact_student_vaccination];
*
* Modification History:
* ---------------------
*    Date       Author	  Nbr	Description
* ---------- ------------ ---	---------------------------------------------
*
* 02/02/2022  Mark F.     0		First created
*  
*
******************************************************************************/
SELECT
       [pnc_patient_id]
      ,[bu_uid]
      ,[patient_immunization_id]
      ,[vaccination_id]
      ,[vaccination_name]
      ,[manufacturer]
      ,[procedure_date]
      ,[lot_number]
      ,[is_administration_record]
      ,[administered_amount]
      ,[administered_amount_units]
      ,[stockroom_id]
      ,[src_modified_date]
      ,[created_date]
      ,[modified_date]
  FROM [emr_dm].[fact_student_vaccination]

GO 
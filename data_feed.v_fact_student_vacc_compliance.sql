SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW data_feed.v_fact_student_vacc_compliance
as
/******************************************************************************
* Name:		data_feed.v_fact_student_vacc_compliance
*
* Version:	1.0
*
* Author:	Mark F. (mfaria@bu.edu)
*
* Date:		02/02/2022
*
*
* Purpose:	view of emr_dm.fact_student_vacc_compliance table for Research Computing access via HDR
*
* Usage:
*    EXEC [data_feed].[v_fact_student_vacc_compliance];
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
      [bu_uid]
      ,[pnc_patient_id]
      ,[compliance_code]
      ,[compliance_status_code]
      ,[expiration_date]
      ,[compliance_exemption_code]
      ,[system_comment]
      ,[compliance_id]
      ,[exempted_date_time]
      ,[patient_compliance_id]
      ,[compliance_date]
      ,[pnc_modified_date]
      ,[created_date]
      ,[modified_date]
  FROM [emr_dm].[fact_student_vacc_compliance]

GO 
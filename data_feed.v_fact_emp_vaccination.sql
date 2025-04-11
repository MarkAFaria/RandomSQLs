SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW data_feed.v_fact_emp_vaccination    
as
/******************************************************************************
* Name:		data_feed.v_fact_emp_vaccination
*
* Version:	1.0
*
* Author:	Mark F. (mfaria@bu.edu)
*
* Date:		02/02/2022
*
*
* Purpose:	view of emr_dm.fact_emp_vaccination table for Research Computing access via HDR
*
* Usage:
*    EXEC [data_feed].[v_fact_emp_vaccination];
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
      [injection_id]
      ,[bu_uid]
      ,[eh_patient_id]
      ,[injection_description]
      ,[injection_code]
      ,[vial]
      ,[vial_id]
      ,[vaccine_dose]
      ,[vaccine_unit_measure]
      ,[vaccine_site_code]
      ,[vaccine_manufacturer]
      ,[vaccine_dose_provider]
      ,[vaccination_date]
      ,[vaccination_location]
      ,[is_fully_vaccinated]
      ,[is_booster_vaccinated]
      ,[first_vax_manufacturer]
      ,[first_vaccine_date]
      ,[last_vax_manufacturer]
      ,[last_vaccine_date]
      ,[vaccine_count]
      ,[doc_id]
      ,[doc_enter_date]
      ,[is_duplicate]
      ,[is_recent_vax_record]
      ,[created_at]
      ,[modified_at]
  FROM [emr_dm].[fact_emp_vaccination]
GO 
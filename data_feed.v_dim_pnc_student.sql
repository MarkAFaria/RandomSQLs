SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW data_feed.v_dim_pnc_student
as
/******************************************************************************
* Name:		data_feed.v_dim_pnc_student
*
* Version:	1.0
*
* Author:	Mark F. (mfaria@bu.edu)
*
* Date:		02/02/2022
*
*
* Purpose:	view of emr_dm.dim_pnc_student table for Research Computing access via HDR
*
* Usage:
*    EXEC [data_feed].[data_feed.v_dim_pnc_student];
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
      ,[first_name]
      ,[middle_name]
      ,[last_name]
      ,[email]
      ,[marital_status]
      ,[birth_date]
      ,[death_date]
      ,[sex]
      ,[cell_phone]
      ,[contact_phone]
      ,[address_line1]
      ,[address_line2]
      ,[city]
      ,[state]
      ,[zip_code]
      ,[affiliation]
      ,[school_code]
      ,[campus_code]
      ,[campus_long_name]
      ,[campus_name]
      ,[student_class]
      ,[student_level]
      ,[on_campus_resident]
      ,[residence]
      ,[register_status_code]
      ,[register_status_name]
      ,[semester]
      ,[race_code]
      ,[race_name]
      ,[ethnicity_code]
      ,[ethnicity_name]
      ,[vaccination_group]
      ,[withdrawal_status]
      ,[dir_person_affiliation]
      ,[ipeds_race_ethnicity]
      ,[labtest_everynhours]
      ,[screen_everynhours]
      ,[screening_badge]
      ,[risk_category]
      ,[calculated_risk_category]
      ,[location_reported]
      ,[attendance_reported]
      ,[is_covid_positive]
      ,[last_postive_test_date]
      ,[recovered_date]
      ,[last_test_date]
      ,[last_test_order_date]
      ,[last_test_result]
      ,[last_test_type]
      ,[last_test_speciman_number]
      ,[last_health_screen_date]
      ,[last_positive_screen_date]
      ,[first_positive_screen_date]
      ,[days_since_last_health_screen]
      ,[days_since_last_covid_test]
      ,[days_since_last_test_order]
      ,[is_fully_vaccinated]
      ,[last_vaccinated_date]
      ,[is_medically_exempt]
      ,[is_religious_exempt]
      ,[is_vaccination_exempt]
      ,[vaccine_exempt_date]
      ,[is_vaccinated_or_exempt]
      ,[vaccinated_or_exempt_date]
      ,[is_vacc_compliance_required]
      ,[pnc_created_date]
      ,[pnc_modified_date]
      ,[created_date]
      ,[modified_date]

  FROM emr_dm.dim_pnc_student

GO 
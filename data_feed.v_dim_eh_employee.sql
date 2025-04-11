SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW data_feed.v_dim_eh_employee
as
/******************************************************************************
* Name:		data_feed.data_feed.v_dim_eh_employee
*
* Version:	1.0
*
* Author:	Mark F. (mfaria@bu.edu)
*
* Date:		02/02/2022
*
*
* Purpose:	view of emr_dm.dim_eh_employee table for Research Computing access via HDR
*
* Usage:
*    EXEC [data_feed].[data_feed.v_dim_eh_employee];
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
      ,[eh_patient_id]
      ,[first_name]
      ,[middle_name]
      ,[last_name]
      ,[address_line1]
      ,[address_line2]
      ,[address_line3]
      ,[city]
      ,[state]
      ,[zip_code]
      ,[contact_phone]
      ,[home_phone]
      ,[work_phone]
      ,[cell_phone]
      ,[email]
      ,[sex]
      ,[marital_status]
      ,[birth_date]
      ,[hire_date]
      ,[termination_date]
      ,[covid_risk_category_code]
      ,[vaccination_group]
      ,[work_schedule_code]
      ,[affiliation]
      ,[campus]
      ,[employment_status_code]
      ,[employment_status]
      ,[personnel_area_code]
      ,[personnel_area]
      ,[personnel_subarea_code]
      ,[personnel_subarea]
      ,[employee_group_code]
      ,[employee_group]
      ,[employee_subgroup_code]
      ,[employee_subgroup]
      ,[org_unit_code]
      ,[org_unit]
      ,[cost_center_code]
      ,[cost_center]
      ,[position_title]
      ,[cdc_race]
      ,[cdc_ethnicity]
      ,[race_code]
      ,[ethnicity_code]
      ,[supervisor_bu_id]
      ,[supervisor_first_name]
      ,[supervisor_last_name]
      ,[supervisor_username]
      ,[supervisor_org_unit_code]
      ,[is_covid_positive]
      ,[diagnosed_date]
      ,[recovered_date]
      ,[last_test_date]
      ,[last_test_result]
      ,[last_test_type]
      ,[last_test_speciman_number]
      ,[death_date]
      ,[last_health_screen_date]
      ,[days_since_last_health_screen]
      ,[days_since_last_covid_test]
      ,[symptom_survey_start_date]
      ,[is_fully_vaccinated]
      ,[is_vaccine_survey_complete]
      ,[is_vaccinated_and_survey_complete]
      ,[is_medically_exempt]
      ,[is_religious_exempt]
      ,[is_vaccination_exempt]
      ,[is_vaccinated_or_exempt]
      ,[first_vaccinated_date]
      ,[last_vaccinated_date]
      ,[vaccine_exempt_date]
      ,[vaccinated_or_exempt_date]
      ,[fully_vaccinated_date]
      ,[is_booster_vaccinated]
      ,[booster_vax_manufacturer]
      ,[booster_vax_date]
      ,[is_new_hire]
      ,[is_single_dose_vaccine]
      ,[is_vaccination_compliant]
      ,[is_booster_compliant]
      ,[eh_create_date]
      ,[eh_modified_date]
      ,[created_date]
      ,[modified_date]
  FROM [emr_dm].[dim_eh_employee]

GO 
--  select count(*) from eh_stage.patients
-- where is_tmp = 0

-- select count(1) from [emr_dm].[dim_eh_employee]
-- where affiliation = 'Affiliate'

-- select count(*) from [emr_dm].[dim_eh_employee]
--  where affiliation = 'Affiliate'

-- latest run data
select log_date as [Load Date], procedure_name as [Load Job Name] , 
       log_message as [Message],
       error_number as [Load Error Code],
       error_message as [Load Error Message]
  from [utility].[dataload_log]
where procedure_name = '[eh_stage].[usp_load_eh_stage_data]'
and log_date >= CAST(CURRENT_TIMESTAMP AS DATE)
order by log_date


select affiliation as 'Employee_Type', employment_status, 
count(employment_status) as '# count'
from [emr_dm].[dim_eh_employee]
where affiliation = 'Affiliate'
group by affiliation, employment_status
order by Employee_Type

select top(10) * from [emr_dm].[dim_eh_employee]
where affiliation = 'Affiliate'


select affiliation as 'Employee_Type', employment_status, 
count(employment_status) as '# count'
from [emr_dm].[dim_eh_employee]
-- where affiliation = 'Affiliate'
group by affiliation, employment_status
order by Employee_Type

select affiliation, employment_status, 
count(employment_status) as '# count', covid_risk_category_code, 
count (covid_risk_category_code) as 'rick count' 
from [emr_dm].[dim_eh_employee]
 --where affiliation = 'Affiliate'
 where covid_risk_category_code = '01'
 group by affiliation, employment_status, covid_risk_category_code
 order by affiliation, employment_status

select bu_uid, eh_patient_id, covid_risk_category_code, first_name, middle_name, last_name, position_title, supervisor_bu_id, address_line1, address_line2, city, state, 
email, sex, birth_date, hire_date, termination_date, vaccination_group, affiliation, campus, employment_status_code, 
employment_status, org_unit_code, org_unit
 from [emr_dm].[dim_eh_employee]
 where affiliation = 'Affiliate'
 and employment_status = 'Active'
 and covid_risk_category_code = '01'

 select affiliation, covid_risk_category_code, 
count (covid_risk_category_code) as 'count' 
from [emr_dm].[dim_eh_employee]
 where affiliation = 'Affiliate'
 -- where covid_risk_category_code = '01'
 group by affiliation, covid_risk_category_code
 -- order by affiliation, employment_status
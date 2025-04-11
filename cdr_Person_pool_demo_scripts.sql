--REM cdr_person_affiliate table
SELECT [bu_id]
    ,[dept_description]
    ,[orgunit_code]
    ,[orgunit_description]
    ,[orgunitparent_code]
    ,[orgunitparent_description]
    ,[personalarea_code]
    ,[personalarea_description]
    ,[personalsubarea_code]
    ,[personalsubarea_description]
    ,[affliateunit_code]
    ,[affliateunit_description]
    ,[affiliate_type]
    ,[affiliate_assignment]
    ,[assignment_begindate]
    ,[assignment_enddate]
    ,[guest_until]
    ,[privilege_items]
    ,[testing_category]
    ,[supervisor_id]
    ,[authentication_systems_access]
FROM [cdr].[cdr_person_affiliate]
WHERE bu_id in ( 'U00166142', 'U00169563')
GO

-- REM cdr_person_basic table
SELECT bu_id, first_name, last_name, middle_name, gender, windowsprincipalname 
FROM [cdr].[cdr_person_basic]
where bu_id in ( 'U00166142', 'U00169563')
GO


--REM cdr_person_birth_date table
SELECT bu_id, birth_date, birth_date_source
FROM [cdr].[cdr_person_birth_date]
where bu_id in ( 'U00166142', 'U00169563')
GO

--REM cdr_person_email table 
SELECT bu_id, email_type, email_address, email_source
FROM [cdr].[cdr_person_email]
where bu_id in ( 'U00166142', 'U00169563')
and email_type in ( 'university', 'personal')
GO

--REM cdr_person_employee_address 
--REM Address of affliates 
SELECT * 
FROM [cdr].[cdr_person_employee_address]
where bu_id in ( 'U00166142', 'U00169563')

--REM Adress of employees
SELECT * 
FROM [cdr].[cdr_person_employee_address]
where bu_id in ( 'U47212608')

--REM Employee Basic information
SELECT bu_id, person_id, personnel_number, main_pernr_indicator, position,
position_description, percent_time, *
FROM [cdr].[cdr_person_employee_basic]
where bu_id in ( 'U00166142', 'U00169563')

--REM cdr_person_degree_program_classes table
SELECT * 
FROM [cdr].[cdr_person_degree_program_classes]
where bu_id in ( 'U00166142', 'U00169563')
GO
-- REM Get Affiliate information Details, email address  

SELECT cpb.bu_id, cpb.first_name, cpb.last_name, cpb.middle_name, cpb.gender, cpb.windowsprincipalname, cpe.email_address, cpe.email_source, cpe.email_type
FROM [cdr].[cdr_person_basic] cpb
Left Join [cdr].[cdr_person_email] cpe on cpe.bu_id = cpb.bu_id 
WHERE  cpb.bu_id in ( 'U00166142', 'U00169563')
AND cpb.bu_id = cpe.bu_id
GO

-- REM Get Affiliate information Details, email address, Address   

SELECT cpb.bu_id, cpb.first_name, cpb.last_name, cpb.middle_name, cpb.gender, cpb.windowsprincipalname, cpe.email_address, cpe.email_source, cpe.email_type, cpea.street, cpea.city, cpea.state, cpea.postalCode
FROM [cdr].[cdr_person_basic] cpb
Left Join [cdr].[cdr_person_email] cpe on cpe.bu_id = cpb.bu_id 
LEFT JOIN [cdr].[cdr_person_employee_address] cpea on cpea.bu_id = cpb.bu_id
WHERE  cpb.bu_id in ( 'U00166142', 'U00169563')
AND cpb.bu_id = cpe.bu_id
GO

-- REM STudent information from Semester

SELECT * 
FROM [cdr].[cdr_person_student_semester]
WHERE bu_id in ('U00253000', 'U00257961', 'U00011341')

-- REM  Student Address 
SELECT * 
FROM [cdr].[cdr_person_student_address]
WHERE bu_id in ('U00253000', 'U00257961', 'U00011341')

--REM Student_birth date and email
SELECT cpbd.bu_id, cpbd.birth_date, cpbd.birth_date_source, cpe.*
FROM [cdr].[cdr_person_birth_date] cpbd
LEFT JOIN [cdr].[cdr_person_email] cpe on cpe.bu_id = cpbd.bu_id
WHERE cpbd.bu_id in ('U00253000', 'U00257961', 'U00011341')
AND cpe.bu_id = cpbd.bu_id

--REM Student information from Semester and Address

SELECT cpss.bu_id, acad_year_semester, registration_status, withdrawal_status, registration_status, campus_name, college_code, cpsa.address_type, cpsa.street, cpsa.city, cpsa.postalCode
FROM [cdr].[cdr_person_student_semester] cpss
INNER JOIN  [cdr].[cdr_person_student_address] cpsa on cpss.bu_id = cpsa.bu_id

WHERE cpss.bu_id in ('U00253000', 'U00257961', 'U00011341')
 
  
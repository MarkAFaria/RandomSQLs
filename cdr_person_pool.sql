IF OBJECT_ID('dbo.cdr_person_pool') IS NOT NULL
BEGIN
    DROP TABLE  dbo.cdr_person_pool
    IF OBJECT_ID('dbo.cdr_person_pool') IS NOT NULL
        PRINT '<<< FAILED TO CREATE TABLE   cdr_person_pool  >>>'
    ELSE
        PRINT '<<< ORIGINAL TABLE cdr_person_pool DROPPED >>>'
END
go
/*=================================================================================
* Name:		cdr_person_pool.tbl  
*
* Version:	1.0
*
* Author:	M Faria 
*
* Date:		07/01/2020
*
*
* Purpose:	table create script for cdr_person_pool table as WIP target to centrally
*           consolidate a source of all-persons population data for BU 
*           DRAFT COPY - DEVELOPMENT PROTOTYPE WORK ONLY
*
* Modification History:
* ---------------------
*    Date  	Author		Nbr  	Description
* ---------- 	------------	---	---------------------------------------------
*
* 
================================================================================*/

create table dbo.cdr_person_pool
( 
    first_name      nvarchar(40) null, 
    last_name       nvarchar(40) not null, 
    middle_name     nvarchar(40) null, 
    user_name       nvarchar(20) null, /** assumption: this is kerberos value, root of email.  Not itemized in CCURE spec.  Placeholder for another source system or DML to derive from email **/
    bu_id           nvarchar(20) null, /** Not itemized in CCURE spec.  Placeholder for another source system **/
    email_address   nvarchar(60) null, 
    portrait_pic    varbinary(max) null, /** assumption: we don't need to populate this now/yet in dev for July 2020 - not until there's a use case **/
    card_number     decimal(10,0) null, /** assumption: decimal or numeric data type is appropriate per note in CCURE spec.  **/
    issue_code      varchar(2) null, /** assumption: 2-charcter code is in alignment with mainframe id_univ_directory or person_basic file  **/
    card_status     varchar(2) null, /** assumption: 2-charcter code is in alignment with mainframe id_univ_directory or person_basic file  **/
    ada_status      varchar(2) null, /** assumption: 2-charcter code is in alignment with mainframe id_univ_directory or person_basic file  **/
    personnel_type  varchar(2) null, /** assumption: distinct from SAP schema values.  2-charcter code is in alignment with mainframe id_univ_directory or person_basic file **/
    windows_principal_name nvarchar(128) null, /** assumption: this is the name string from AD **/
    employee_status     varchar(2) null, /** assumption: 2-charcter code is in alignment with mainframe id_univ_directory or person_basic file  **/
    employee_orgunit    nvarchar(8) null, /** assumption: placeholder alternate consideration; mapping of SAP hierarchy represented later in this DDL script  **/
    employee_department     nvarchar(8) null, /** assumption: placeholder alternate consideration; mapping of SAP hierarchy represented later in this DDL script  **/
    employee_campus_name    nvarchar(8) null, /** assumption: placeholder alternate consideration; mapping of SAP hierarchy represented later in this DDL script  **/
    employee_address        nvarchar(60) null, /** assumption: placeholder alternate consideration; mapping of SAP work_street_address  **/
    parking_lot     nvarchar(60) null, /** assumption: placeholder nvarchar(60) as datatype until further information on source attribute **/
    student_status  nvarchar(10) null, /** assumption: placeholder nvarchar(10) as datatype until further information on source attribute **/
    student_academic_college    nvarchar(30) null, /** assumption: placeholder nvarchar(30) as datatype until further information on source attribute **/
    student_academic_department nvarchar(30) null, /** assumption: placeholder nvarchar(30) as datatype until further information on source attribute **/
    student_address nvarchar(60) null, /** assumption: placeholder nvarchar(60) as datatype until further information on source attribute **/
    student_campus_name nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute **/
    student_semester    nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute **/
    student_class_schedule  nvarchar(max) null, /** assumption: placeholder nvarchar(max) as potential JSON datatype until further information on source attribute **/
    student_degree_program  nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute **/
    student_graduation_date nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute, column type of decimal or date may be more appropriate **/
    student_housing_assignment  nvarchar(max) null, /** assumption: placeholder nvarchar(max) as potential JSON datatype until further information on source attribute **/
    affiliate_status    nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute **/
    affiliate_type  nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute **/
    master_status   nvarchar(20) null, /** assumption: placeholder nvarchar(20) as datatype until further information on source attribute **/
    employee_position_name  nvarchar(158) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-POSLN_TX2 **/
    org_unit_code   nvarchar(24) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-0ORGUNIT **/
    org_unit_name   nvarchar(60) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-0ORGUNIT_T **/
    employee_group_code nvarchar(1) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-ZBU_UNIT  **/
    employee_group_name nvarchar(20) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-ZBU_UNIT_T  **/
    employee_subgroup_code  nvarchar(2) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-0EMPLGROUP  **/
    employee_subgroup_name  nvarchar(20) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-0EMPLGROUP_T  **/
    personnel_area_code     nvarchar(4) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-0PERS_AREA **/
    personnel_area_name     nvarchar(20) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-0PERS_AREA_T  **/
    workloc_primary_1   nvarchar(35) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-ZNAMEP  **/
    workloc_primary_2   nvarchar(35) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-ZNAME2P  **/
    work_street_address     nvarchar(60) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-ZSTREETP **/
    work_city   nvarchar(40) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-ZCITY40P **/
    work_region     nvarchar(3) null, /** assumption: column type and schema in alignment with SAP source ZHCM_CP01-ZREGIONP  **/
    work_postal_code    nvarchar(10) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-ZPST_CD1P **/
    work_phone_number   nvarchar(30) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-ZTEL_NBRS **/
    alt_phone_number    nvarchar(30) null, /** assumption: column type and schema in alignment with SAP source  ZHCM_CP01-????  **/
    work_building   nvarchar(20) null, /** assumption: column type and schema in alignment with SAP source  BUILDING20 - what about alignment with official FMI building codes? **/
    student_phone_number    nvarchar(30) null, /** assumption: column type and schema in alignment with a SIS data source - TBD? **/
    student_street_address  nvarchar(60) null, /** assumption: column type and schema in alignment with a SIS data source - TBD? **/
    student_room_appt_no    nvarchar(10) null, /** assumption: column type and schema in alignment with a SIS data source - TBD? **/
    student_city    nvarchar(40) null, /** assumption: column type and schema in alignment with a SIS data source - TBD? **/
    student_postal_code nvarchar(10) null, /** assumption: column type and schema in alignment with a SIS data source - TBD? **/

);
IF OBJECT_ID('dbo.cdr_person_pool') IS NOT NULL
        PRINT '<<< cdr_person_pool table created successfully  >>>'
ELSE
        PRINT '<<< TABLE cdr_person_pool WAS NOT Created >>>'
go

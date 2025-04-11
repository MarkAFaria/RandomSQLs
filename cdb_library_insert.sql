/*** insert entry 1 
  

SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (1,
  'v_cdr_univ_directory',
  'view',
  'Legacy ID_UNIV_DIRECTORY pass-through view of mainframe ADABAS file used for Informatica staging',
  'Mainframe',
  'Mainframe',
  'Dietrich Warner', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  null,
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
  ****/

/*** insert entry 2
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (2,
  'v_cdr_person_basic',
  'view',
  'Legacy PERSON_BASIC pass-through view of mainframe ADABAS file used for Informatica staging',
  'Mainframe',
  'Mainframe',
  'Dietrich Warner', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  null,
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go

  ****/

/*** insert entry 3 
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (3,
  'v_cdr_mf_acad_institution',
  'view',
  'List of Academic Institutions from mainframe legacy ADABAS file',
  'IS&T AS&IR',
  'Mainframe',
  'Elizabeth Campbell', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  'Academic Institutions – Mainframe sourced - ACAD_REPORT.DIM_ACADEMIC_INSTITUTION pass thru from ETL Oracle Stage',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
***/ 

/*** insert entry 4 
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (4,
  'v_cdr_fm_college',
  'view',
  'List of Boston University Schools and Colleges from mainframe legacy ADABAS file',
  'IS&T AS&IR',
  'Mainframe',
  'Elizabeth Campbell', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  'Colleges - Mainframe sourced - CONFORMED_DIM_REPORT.DIM_COLLEGE_COA_UNIT pass thru from ETL Oracle Stage',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
***/

/*** insert entry 5 
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (5,
  'v_cdr_person_phone',
  'view',
  'Phone number identity legacy PERSON_PHONE pass-through view of mainframe ADABAS file used for Informatica',
  'Mainframe',
  'Mainframe',
  'Dietrich Warner', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  'Phone number by Univ ID – Mainframe sourced - CONFORMED_DIM_STAGE.PERSON_ADDRESS_PHONE pass thru from ETL Oracle Stage',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
***/

/*** insert entry 6  
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (6,
  'v_cdr_sap_cost_center',
  'view',
  'Financial Cost Center Hierarchy - Master Data  pass-through view used for Informatica staging',
  'Budget Off., Comptroller',
  'Oracle Stage from SAP',
  'Inez Garrant, Gillian Emmons', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  'SAP Sourced - SAP_STAGE.CSKT_CSKS pass thru from ETL Oracle Stage',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go

***/
 
/*** insert entry 7 
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (7,
  'v_cdr_sap_gl_account',
  'view',
  'General Ledger Account Hierarchy - Master data  pass-through view used for Informatica staging',
  'Budget Off., Comptroller',
  'Oracle Stage from SAP',
  'Inez Garrant, Gillian Emmons', 
  'Pass-thru ref. to Oracle Stage', 
  'ETL to Oracle Stg wkday by 9am',
  'SAP Sourced - SAP_STAGE.SKAT pass thru from ETL Oracle Stage',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
 
***/

/*** insert entry 8 
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (8,
  'v_cdr_hana_employee',
  'view',
  'Employee data - generic view based on V_ZEMP_CDR_HV2 from SAP BW',
  'Central HR',
  'SAP HCM',
  'Dietrich Warner', 
  'Pass-thru ref. to BW HANA view', 
  'daily by 7:30am SLA',
  'HANA view, direct call. BW data load from SAP HCM source transaction system usually concludes by 5:30am, HCM data portion usually completes 2 hours prior to that',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
 
 ****/

 /*** insert entry 9 

SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (9,
  'v_cdr_dim_building',
  'view',
  'Building data master data',
  'Campus Planning & Operations',
  'FM Interact  Matt Walsh',
  'Gregg Snyder', 
  'Manual spreadsheet from FMI', 
  'on request',
  'Provided on request as manual extract in spreadsheet format  Data change is infrequent  Consider annual or automated refresh as future enhancement',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go

***/

/*** insert entry 10  

SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (10,
  'cdr_library',
  'user_table',
  'cdr metadata regarding data objects maintained in common data repository for possible external reference or distribution',
  'IS&T Data Architecture',
  'cdr operations',
  'Preetish Mukundan', 
  'Manual direct maintenance', 
  'current ops',
  'cdr metadata',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go
****/

/*** insert entry 11 

SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] ON

  insert into CDR_DB.dbo.cdr_library 
  ([identity_key],
  [cdr_object_name],
  [object_type],
  [description],
  [data_source_dpt],
  [data_source_sys],
  [data_trustee],
  [data_load_process],
  [refresh_schedule],
  [notes],
  [create_date],
  [create_id],
  [update_date],
  [update_id])

  VALUES (11,
  'cdr_library_use',
  'user_table',
  'cdr metadata regarding data objects referenced from common data repository',
  'IS&T Data Architecture',
  'cdr operations',
  'Preetish Mukundan', 
  'Manual direct maintenance', 
  'current ops',
  'cdr metadata',
  getdate(),
  'mfaria',
  getdate(),
  'mfaria'
)
SET IDENTITY_INSERT [CDR_DB].[dbo].[cdr_library] OFF
go

***/ 
/** SELECT a.RDBMS, a.Database_Schema, a.ServiceNow_Group, a.Owner_Contact, a.Lifecycle, a.host, a.Related_Application
FROM RDBMS_Inventory a  -- , Server_Hosts b
where a.RDBMS in ('Aurora', 'AWS') -----, 'MySQL') 
order by a.Lifecycle DESC
**/
SELECT distinct a.RDBMS, a.Database_Schema, a.ServiceNow_Group, a.Owner_Contact, a.Lifecycle, a.host, a.Related_Application,
b.Host_OS, b.RDBMS_Version, b.RDBMS_End_of_Support
FROM RDBMS_Inventory a, Server_Hosts b
where a.RDBMS = b.RDBMS and a.Host = b.Host
and a.RDBMS in ('Aurora', 'AWS') -----, 'MySQL') 
order by a.Lifecycle DESC



select a.Database_Schema, a.Lifecycle, a.host, a.Department_Owner, a.Owner_Contact, 
a.ServiceNow_Group, a.Related_Application, b.RDBMS_Version, b.RDBMS_End_of_Support
from dbo.RDBMS_Inventory a, dbo.Server_Hosts b
where a.Host = b.Host 
    and a.RDBMS = 'MYSQL'
    and b.RDBMS_Version like '5.7%'
 --   and a.Lifecycle = 'PROD'
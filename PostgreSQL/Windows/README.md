# How to take DUMP backup from PostgreSQL and restore to another server in Windows environment?
## Backup process:
### You can take backup by using following scripts:
#### dump_backup_database.ps1: It will be used for fulll database backup.
#### dump_backup_schema.ps1: It will be used for schema backup of a database.
#### dump_backup_table.ps1: It will be used for table backup of a schema in a database.

## Restore process:
### You must CREATE a empty database before restoration of the database. You can use following script to restore the database / schema/ table. 
#### restore_backup_database.ps1 : It will be used for dump backup restroation into PostgreSQL database.
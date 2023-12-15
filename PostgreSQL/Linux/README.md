# How to take DUMP backup from PostgreSQL and restore to another server in Linux environment?
## Backup process:
You can take backup by using following scripts:
### dump_backup_database.sh: It will be used for fulll database backup.
### dump_backup_schema.sh: It will be used for schema backup of a database.
### dump_backup_table.sh: It will be used for table backup of a schema in a database.

## Restore process:
Whatever you take the backup, your restoration is remain same for database, schema and table. 
### restore_backup_database.sh : It will be used for dump backup restroation into PostgreSQL database.


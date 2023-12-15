# How to take DUMP backup from PostgreSQL and restore to another server in Linux environment?

## Prerequisites:
### You must install PostgreSQL client (pg_dump & pg_restore) in the host machine where you will run the BACKUP and RESTORE process. If you want to take backup from PostgreSQL server, you don't need to install PostgreSQL client.

## Backup process:
### You can take backup by using following scripts:
#### dump_backup_database.sh: It will be used for fulll database backup.
#### dump_backup_schema.sh: It will be used for schema backup of a database.
#### dump_backup_table.sh: It will be used for table backup of a schema in a database.

## Restore process:
### You must CREATE a empty database before restoration of the database. You can use following script to restore the database / schema/ table. 
#### restore_backup_database.sh : It will be used for dump backup restroation into PostgreSQL database.


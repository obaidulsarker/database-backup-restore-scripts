# Where pg_dump binary is located
$PG_RESTORE = "D:\Program Files\PostgreSQL\14\bin\pg_restore.exe"

# Host Name or IP address of the database server
$HOST_NAME = "localhost"

# Port of the database server
$PORT = 5432

# Database name which want to take backup
$DB_NAME = "sample_db"

# Database user which will use to take the backup
$DB_USER = "postgres"

# Database user password
$DB_USER_PASS = "biTS@#123"

# Where you want to store backup files
$BACKUP_BASE_LOCATION = "D:\backup\$DB_NAME"

# You don't need to change below variables
$BACKUP_LOCATION = Join-Path $BACKUP_BASE_LOCATION "dump"
$LOG_LOCATION = $BACKUP_LOCATION
$LOGFILE = Join-Path $LOG_LOCATION "restore-backup-db-log.log"

# Specify extact DUMP file location
$DUMP_FILE = Join-Path $BACKUP_LOCATION "sample_db-2023-12-15_17-08-59.dump"


# Create directory if not exists
New-Item -ItemType Directory -Force -Path $BACKUP_LOCATION

# Perform Backup
Add-Content -Path $LOGFILE -Value "$((Get-Date) -f 'yyyy-MM-dd HH:mm:ss'): DB[$DB_NAME] restoration is STARTED"

$env:PGPASSWORD = $DB_USER_PASS
& $PG_RESTORE --host $HOST_NAME --port $PORT  -U $DB_USER -c -v -d $DB_NAME $DUMP_FILE

Add-Content -Path $LOGFILE -Value "$((Get-Date) -f 'yyyy-MM-dd HH:mm:ss'): DB[$DB_NAME] restoration is FINISHED"

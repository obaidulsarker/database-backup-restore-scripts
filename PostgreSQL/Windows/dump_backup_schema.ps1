# Where pg_dump binary is located
$PGDUMP = "D:\Program Files\PostgreSQL\14\bin\pg_dump.exe"

# Host Name or IP address of the database server
$HOST_NAME = "localhost"

# Port of the database server
$PORT = 5432

# Database name which want to take backup
$DB_NAME = "sample_db"

# Provide database SCHEMA name which want to take backup
$SCHEMA_NAME = "public"

# Database user which will use to take the backup
$BACKUP_USER = "postgres"

# Database user password
$BACKUP_PASS = "biTS@#123"

# Where you want to store backup files
$BACKUP_BASE_LOCATION = "D:\backup\$DB_NAME"

# You don't need to change below variables
$BACKUP_LOCATION = Join-Path $BACKUP_BASE_LOCATION "dump"
$LOG_LOCATION = $BACKUP_LOCATION
$LOGFILE = Join-Path $LOG_LOCATION "dump-backup-schema-log.log"
$BACKUP_FILENAME = Join-Path $BACKUP_LOCATION "$DB_NAME-$SCHEMA_NAME-$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').dump"

# Create directory if not exists
New-Item -ItemType Directory -Force -Path $BACKUP_LOCATION

try {
# Perform Backup
Add-Content -Path $LOGFILE -Value "$((Get-Date) -f 'yyyy-MM-dd HH:mm:ss'): DB[$SCHEMA_NAME] backup is STARTED"

$env:PGPASSWORD = $BACKUP_PASS
& $PGDUMP --username $BACKUP_USER --host $HOST_NAME --port $PORT -Fc --lock-wait-timeout=600 --no-sync --schema $SCHEMA_NAME -f $BACKUP_FILENAME $DB_NAME

Add-Content -Path $LOGFILE -Value "$((Get-Date) -f 'yyyy-MM-dd HH:mm:ss'): DB[$SCHEMA_NAME] backup is FINISHED"
}

catch {
	Add-Content -Path $LOGFILE -Value "$((Get-Date) -f 'yyyy-MM-dd HH:mm:ss'): ERROR - $($_.Exception.Message)"
}

finally {
    # Clear the password from the environment variable
    Remove-Item Env:\PGPASSWORD
}

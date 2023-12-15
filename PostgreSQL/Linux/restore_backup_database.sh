#!/bin/bash

# Where pg_restore binary is located
PG_RESTORE=/usr/pgsql-14/bin/pg_restore

# Host Name or IP address of the database server
HOST=localhost

# Port of the database server
PORT=5432

# Database name which want to take backup
DB_NAME=sample_db

# Database user which will use to take the backup
DB_USER=postgres

# database user password
DB_USER_PASS='xxxxxxxxx'

# Where you want to store backup files
BACKUP_BASE_LOCATION=/backup/$DB_NAME

# You don't need to change below variables
BACKUP_LOCATION=$BACKUP_BASE_LOCATION/dump
LOG_LOCATION=$BACKUP_LOCATION
LOGFILE=$LOG_LOCATION/restore-backup-db-log.log

# Specify extact DUMP file location
DUMP_FILE=$BACKUP_LOCATION/sample-db-2023-12-18.dump

# Create directory if not exists
mkdir -p $BACKUP_LOCATION

# Perform Backup
echo "$(date) : DB[$DB_NAME] restoration is STARTED" >> $LOGFILE;

PGPASSWORD=$DB_USER_PASS $PG_RESTORE --host $HOST --port $PORT  -U $DB_USER -c -v -d $DB_NAME $DUMP_FILE 2>> $LOGFILE

echo "$(date) : DB[$DB_NAME] restoration is FINISHED" >> $LOGFILE;
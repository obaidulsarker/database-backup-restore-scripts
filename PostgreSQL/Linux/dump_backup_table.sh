#!/bin/bash

# Where pg_dump binary is located
PGDUMP=/usr/pgsql-14/bin/pg_dump

# Host Name or IP address of the database server
HOST=localhost

# Port of the database server
PORT=5432

# Database name which want to take backup
DB_NAME=sample_db

# Provide Schema Name
DB_SCHEMA_NAME=public

# Provide Table Name
DB_TABLE_NAME=$DB_SCHEMA_NAME.sample_table

# Database user which will use to take the backup
BACKUP_USER=postgres

# database user password
BACKUP_PASS='xxxxxxxxx'

# Where you want to store backup files
BACKUP_BASE_LOCATION=/backup/$DB_NAME


# You don't need to change below variables
BACKUP_LOCATION=$BACKUP_BASE_LOCATION/dump
LOG_LOCATION=$BACKUP_LOCATION
LOGFILE=$BACKUP_LOCATION/dump-backup-db-log.log
BACKUP_FILENAME=$BACKUP_LOCATION/$DB_NAME-$DB_TABLE_NAME-$(date +%F_%H-%M-%S).dump

# Create directory if not exists
mkdir -p $BACKUP_LOCATION

# Perform Backup
echo "$(date) : DB[$DB_NAME] backup STARTED" >> $LOGFILE;

PGPASSWORD=$BACKUP_PASS $PGDUMP --username $BACKUP_USER  --host $HOST --port $PORT -Fc --lock-wait-timeout=600 --no-sync --table $DB_TABLE_NAME -f $BACKUP_FILENAME $DB_NAME 2>> $LOGFILE;


echo "$(date) : DB[$DB_NAME] backup FINISHED" >> $LOGFILE;
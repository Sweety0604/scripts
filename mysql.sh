#!/bin/bash

#Create a database dbname &  Dump the database using mysqldump

echo "Set variable for database dump"
USER="root"
HOST="localhost"
DB_NAME="sweety"
BACKUP_PATH="/Sweety/backup"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Set default file permissions"
umask 177

echo "Dump database into SQL file"
/usr/bin/mysqldump  --user="$USER" --host="$HOST" "$DB_NAME" > "$BACKUP_PATH/$DB_NAME-$DATE.sql"

echo "Delete files older than 30 days"
find "$BACKUP_PATH"/* -mtime +7 -exec rm {} \;


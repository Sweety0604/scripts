echo "Set variable for database dump"
USER="root"
HOST="localhost"
DB_NAME="sweety"
BACKUP_PATH="/Sweety/backup"
DATE=$(date +"%d-%b-%Y")

echo "Set default file permissions"
umask 177

echo "Do you want to restore data? (yes/no)"
read restore_option

if [ "$restore_option" == "yes" ]; then
    echo "Enter the path to the SQL file you want to restore:"
    read sql_file_path
    if [ -f "$sql_file_path" ]; then
        echo "Restoring database from $sql_file_path"
        /usr/bin/mysql --user="$USER" --host="$HOST" "$DB_NAME" < "$sql_file_path"
        echo "Database restored successfully."
    else
        echo "File not found."
    fi
elif [ "$restore_option" == "no" ]; then
    echo "Data restoration skipped."
else
    echo "Invalid option. Data restoration skipped."
fi

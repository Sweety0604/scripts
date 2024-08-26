#!/bin/bash

TODAY=`date +"%Y-%m-%d_%H-%M-%S"`  
DB_BACKUP_PATH='/Sweety/backup/mongo'
MONGO_HOST='localhost'
MONGO_PORT='27017'
AUTH_ENABLED=0
MONGO_USER='sweety'
MONGO_PASSWD=''
DATABASE_NAMES='ALL'
#DATABASE_NAMES='admin sweety'

####################################################
 
#mkdir -p ${DB_BACKUP_PATH}/${TODAY}

AUTH_PARAM=""

if [ ${AUTH_ENABLED} -eq 1 ]; then
	AUTH_PARAM=" --username ${MONGO_USER} --password ${MONGO_PASSWD} "
fi

if [ ${DATABASE_NAMES} = "ALL" ]; then
	echo "You have choose to backup all databases"
	mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} ${AUTH_PARAM} --out ${DB_BACKUP_PATH}/${TODAY}/
else
	#echo "Running backup for selected databases"
	for DB_NAME in ${DATABASE_NAMES}
	do
		mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} --db ${DB_NAME} ${AUTH_PARAM} --out ${DB_BACKUP_PATH}/${TODAY}/
	done
fi



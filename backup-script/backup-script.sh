#!/bin/bash

echo "V0.2"

: "${DEPLOY_MODE:?Ошибка: Переменная DEPLOY_MODE  должна быть установленна!}"

log_dir=$1

function log_action()
{
echo "[$(date +%Y-%m-%d_%H:%M:%S)] $1"
}

function target_dir()
{
echo "checking if /tmp/backup/$1 is exist"
if [ -d /tmp/backup/$1 ]
then
	echo "dir /tmp/backup/$1 exists sciping this step"
else
	echo "creating directory /tmp/backup/$1 "
	mkdir -p  /tmp/backup/$1
fi

}

if [ -d "$log_dir" ]
then 
	if [ "$DEPLOY_MODE" = "PROD" ]
	then
		echo "deploy mode = prod"
		target_dir "$DEPLOY_MODE"
	elif [ "$DEPLOY_MODE" = "DEV" ]
	then 
		echo " deploy mode = dev"
		target_dir "$DEPLOY_MODE"
	fi
else
	echo "is not dir or it not exsist"
fi

#!/bin/bash

echo "V0.1"

: "${DEPLOY_MODE:?Ошибка: Переменная DEPLOY_MODE  должна быть установленна!}"

log_dir=$1

function log_action()
{
echo "[$(date +%Y-%m-%d_%H:%M:%S)] $1"
}


if [ -d "$log_dir" ]
then 
	if [ "$DEPLOY_MODE" = "PROD" ]
	then
		echo "deploy mode = prod"
	elif [ "$DEPLOY_MODE" = "DEV" ]
	then 
		echo " deploy mode = dev"
	fi
else
	echo "is not dir"
fi

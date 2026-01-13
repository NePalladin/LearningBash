#!/bin/bash

echo "V0.2"

: "${DEPLOY_MODE:?Ошибка: Переменная DEPLOY_MODE  должна быть установленна!}" #проверяем установленна ли переменная окружения DEPLOY_MODE 

log_dir=$1 #оглашаем переменную и присваем ей значение переданное при запуске скрипта

function log_action() #функция для логирования копирования файлов
{
echo "[$(date +%Y-%m-%d_%H:%M:%S)] $1"
}

function target_dir() #функция проверяющяя существует ли целевая дирректория для копирования, если нет, то создает ее
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

function copy_files()
{
for file in "$1"/*
do
	cp "$file" /tmp/backup/$2
	log_action "Скопирован файл $file"
done

}

if [ -d "$log_dir" ] #проверка существует ли дирректория из которой мы копируем и директория ли это вообще
then 
	if [ "$DEPLOY_MODE" = "PROD" ]
	then
		echo "deploy mode = prod"
		target_dir "$DEPLOY_MODE"
		copy_files $log_dir $DEPLOY_MODE
	else
		echo " deploy mode = dev"
		target_dir "$DEPLOY_MODE"
		copy_files $log_dir $DEPLOY_MODE

	fi
else
	echo "is not dir or it not exsist"
fi

echo "Скрипт завершил работу с кодом $?"

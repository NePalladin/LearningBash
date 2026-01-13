#!/bin/bash

echo "V1.0"

: "${DEPLOY_MODE:?Ошибка: Переменная DEPLOY_MODE  должна быть установленна!}" #проверяем установленна ли переменная окружения DEPLOY_MODE 

log_dir=$1 #оглашаем переменную и присваем ей значение переданное при запуске скрипта

function log_action() #функция для логирования копирования файлов
{
echo "[$(date +%Y-%m-%d_%H:%M:%S)] $1"
}

function target_dir() #функция проверяющяя существует ли целевая дирректория для копирования, если нет, то создает ее
{
echo "Проверяю сущестлвует ли /tmp/backup/$1"
if [ -d /tmp/backup/$1 ]
then
	echo "Дирректория /tmp/backup/$1, пропускаем этот шаг "
else
	echo "Создание дирректории /tmp/backup/$1 "
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
	if [[ "$DEPLOY_MODE" != "PROD"  && "$DEPLOY_MODE" != "DEV" ]]
	then
		echo "Ошибка: DEPLOY_MODE должен быть DEV или PROD (сейчас $DEPLOY_MODE) "
		exit 1
	fi	
		echo " Запуск в режиме  = $DEPLOY_MODE"
		target_dir "$DEPLOY_MODE"
		copy_files $log_dir $DEPLOY_MODE
else
	echo "Указаный путь не действителен либо это не дирректория"
fi

echo "Скрипт завершил работу с кодом $?"

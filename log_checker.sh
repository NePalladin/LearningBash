#!/bin/bash

dir_path=$1
if [ -d "$dir_path" ]
then
	echo "Содержимое папки: $dir_path"
	for file in "$dir_path"/*
	do
		if [ -f "$file" ]
		then
			if [[ "$file" == *.log ]]
			then
				echo "Это файл логов: $file"
			else	
				echo "это обычный файл: $file"
			fi
		else
			echo "Это дирректория: $file"
		fi
	done
else 
	echo "Ошибка: $dir_path не дирректория"
	exit 1	
fi

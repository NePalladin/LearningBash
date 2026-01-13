#!/bin/bash

echo "Версия скрипта 1.1"

function calc()
{
	if [ $1 == "-"  ]
	then
		summ=$(($2-$3))
		echo "Разница между "$2" и "$3" равна: $summ  "
	elif [ $1 == "+" ]
	then	
		summ=$(($2+$3))
		echo "Сумма "$2" и "$3" равна: $summ"
	fi
}
echo "Что делаем?"

select oper in "-" "+" "выход"
do
	case $oper in
	       	"-")
		read -p "От чего отнимаем: " num1
		read -p "Что отнимаем:" num2
		calc "$oper" "$num1" "$num2" 
		;;

		"+")
			read -p "С чем складываем: " num1
			read -p "Что складываем: " num2
			calc "$oper" "$num1" "$num2"
		;;
		"выход")
			break
		;;
		*)
			echo "Неверная опция, повторите выбор"
		;;
	esac
done

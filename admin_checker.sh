#!/bin/bash

read -p "Who are you: " user_input

if [ "$user_input" == "admin" ]
then
	echo "You are admin!"
else
	echo "You are ot admin:("
	exit 1
fi
echo "Check end with code: $?"

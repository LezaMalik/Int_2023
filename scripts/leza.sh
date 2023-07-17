#!/bin/bash

while getopts 'ain' OPTION; do
	case "$OPTION" in
		a)
			 echo "Rawalpindi"
			;;
		i)

			 echo "My name is Leza Malik. I live in Rawalpindi. I have completed my bachelors in Computer Science from COMSATS University, Islamabad."
			;;
		n)
			 echo "Leza Malik D/O Muhammad Murtaza"
			;;
		?)
			echo "Invalid Flag"
			;;
	esac
done
 


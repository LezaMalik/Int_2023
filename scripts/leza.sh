#!/bin/bash
# Make a Bash Script which has name as your name. And also takes flag values
# -a to print address
# -i to print breif intro about you
# -n to print your full name and fathers name

while getopts 'ain' OPTION; do
	case "$OPTION" in
		a)
			 echo "Rawalpindi/Pakistan"
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
 


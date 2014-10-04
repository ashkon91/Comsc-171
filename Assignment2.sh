#!/bin/bash

#Ashkon Honardoost - COMSC171
#5/12/2013
#Assignment 2
#Description: This program takes input from a shall script then it will output the stripped script without comments  
#
#To run do the following inputs in your CMD line. 
#1.) chmod u+x Assignment2.sh 
#2)cat input.sh | ./assignment2.bsh > output.sh      #input.sh can be any file 

#====================================================
#Disclaimer for the user
#====================================================
echo ""
echo "#======================================================================================================================"
echo "#ATTENTION:"
echo "#This code has been stripped of all comments by Ashkon Honardoost's UNIX Code Stripper!"
echo "#This code was create as part of COMSC-171 and is prohibited for use in an academic enviornment without my permission. "
echo "#For the source please check github.com/ashkon91. Let me know if you have any questions."
echo "#======================================================================================================================"
echo ""
# ===================================================
#    Main Funcition
# ===================================================

#dowhile loop to read through each line
while read -r ln
do
	#==================
	#Declares Variables
	#==================
	counter=$2
	len=${#ln}  # get length of string

	typeset -i x=0
	quotetype=""     
	startquote="F"    
	part1=""
	hasprinted="F" #checks for if its printed


	#accepts lines with no #
	if [[ ! $ln =~ \# ]]  #checks to see if theres a #
	then
		echo "$ln" #prints the line
		continue  
	fi

	#Accepts the shebang line
	if [[ $ln =~ ^#!+ ]] #Checks for the ! after a #
	then
		echo "$ln" #prints the line
		continue  
	fi

	#Checks for a # at the beginning of a line
	if [[ $ln =~ ^#+ ]] #checks for # at the beginning of a line
	then
		echo "" #prints a blank line since line is comment
		continue  
	fi

	#checks to see if # is part of a word
	if [[ ! $ln =~ \ \# ]]  #if its part of a word it accepts it
	then
		echo "$ln" #prints the line
		continue			  
	fi

	#Checks for # inside quotes
	while (( $x < $len )) #checks to see if the string is less than 0
	do
		ch=${ln:x:1} #break the strings to 1 character

		if [[ $ch =~ \" ]] #Checks to see if character is double quote
		then
			if [[ $startquote =~ \F ]]
			then
				startquote="T" #sets to inside a quote
				quotetype=\" 
			else
				if [[ $quotetype =~ \" ]] #checks is char is double quote
				then
					startquote="F" #sets to not in a quote
					quotetype=""
				fi
			fi
		elif [[ $ch =~ \' ]] #checks is char is single quote
		then
			if [[ $startquote =~ \F  ]]
			then
				startquote="T" #sets to inside a quote
				quotetype=\'
			else
				if [[ $quotetype =~ \' ]] #checks if char is single quote
				then
					startquote="F" #sets to outside a quote
					quotetype=""
				fi
			fi
		elif [[ $ch =~ \# ]] #checks for the # within and prints
		then
			if [[ $startquote =~ \F && $prevch =~ \  ]]
			then
				echo ${ln:0:x}
				hasprinted="T" #sets value to has printed
			fi
		fi
		prevch=$ch
		(( x++ ))
		if [[ $hasprinted =~ \F ]] #makes sure something has printed if not then it prints the currnet line.
			then
			if [[ $x == $len ]] 
				then echo ${ln}
			fi
		fi
	done

done

exit

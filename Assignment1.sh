#! /bin/bash

echo "==============================="
echo "=Assignment 1: Number Addition="
echo "=Author:Ashkon Honardoost     ="
echo "=This program will take in a  ="
echo "=set amount of numbers and    ="
echo "=calculate its sum            ="
echo "==============================="

sum=0 #create the sum variable to add integers to 

echo "How many numbers do you want to add today?"	 #asks the user how many values theyd like to add
read counter        							  #reads the input

for i in `seq 2 $(expr "$counter" + "1")` #Creates the loop. Counter is added by 1 to do the correct ammount user asks for.
do
	echo "The current sum is $sum" #prints current sum
    echo "Please enter your number to be added" #prompts use to enter a number to be added
    read b                                #reads the sum input
    sum=$(expr "$sum" + "$b") 				#adds the new number to current sum
    echo ""					  			#blank line for better spacing
    
done
 
echo ""
echo "The total sum of the numbers is  $sum" #prints the sum


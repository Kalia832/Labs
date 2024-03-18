#!/bin/bash
read -p "Enter Number of line: " n 
for  (( i=1;i<=n;i++ ))
do	
	for (( j=1;j<=i;j++ ))
	do
	 echo -n "$i"
	done
	echo ""
done
read -p "Do You want to clear the screen(y/n):" ans
if [[ ans -eq 'y'  ]]
then
clear
fi
#!/bin/bash
read -p "Enter a string:" str
read -p "Enter a character to search:" ch
len=$(echo  "$str" | grep -o $ch | wc -l )
echo -n "$ch is Present :$len Times"
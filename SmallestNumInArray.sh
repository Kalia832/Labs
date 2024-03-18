#!/bin/bash
arr=(1 2 3 4 5 6 7 8 0)
arrlen=${#arr[*]}
greatest=${arr[0]}
for(( i=1;i<arrlen;i++ ))
do
    if [[ ${arr[i]} -lt greatest ]]
    then
        greatest=${arr[i]}
    fi
done
echo "Smallest Number in the array is: $greatest"
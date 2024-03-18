#!/bin/bash
arr=(5 2 3 4 0 8 9 1 6)
temp=0
arrlen=${#arr[*]}
for (( i=0;i<arrlen-1;i++ ))
do
    for (( j=0;j<arrlen-1-i;j++ ))
    do
        if [[ ${arr[$j]} -gt ${arr[$((j+1))]} ]]
        then
            temp=${arr[$j]}
            arr[$j]=${arr[$((j+1))]}
            arr[$((j+1))]=$temp
        fi
        temp=0
    done
done
for (( i=0;i<arrlen;i++ ))
do
    echo -n " ${arr[$i]}"
done

#!/bin/bash
read -p "Enter a String: " arr
a=0;e=0;i=0;o=0;u=0;
echo ${#arr[0][*]}
for k in {0..100}
do
    j=${arr:k:1}
    
    echo -n " $j"
    if [[ $j == "a" ]]
    then 
        let a+=1;
    elif [[ $j == "e" ]]
    then 
        let e+=1;
    elif [[ $j == "i" ]]
    then 
        let i+=1;
    elif [[ $j == "o" ]]
    then 
        let o+=1;
    elif [[ $j == "u" ]]
    then
        let u+=1;
    fi
done
    echo ""
    if [[ $a != 0 ]]
    then
        echo "A: $a"
    fi
    if [[ $e != 0 ]]
    then
        echo "E: $e"
    fi
    if [[ $i != 0 ]]
    then
        echo "I: $i"
    fi
    if [[ $o != 0 ]]
    then
        echo "O: $o"
    fi
    if [[ $u != 0 ]]
    then
        echo "U: $u"
    fi
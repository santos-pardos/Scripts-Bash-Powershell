#!/bin/bash

num1=$(shuf -i 1-10 -n 1)
num2=$(shuf -i 1-10 -n 1)

if [ $num1 -eq $num2 ]
then
    echo $num1 y $num2 son iguales
fi

if [ $num1 -ne $num2 ]
then
    echo $num1 y $num2 no son iguales
fi

if [ $num1 -gt $num2 ]
then
    echo $num1 es mayor que $num2
fi

if [ $num1 -ge $num2 ]
then
    echo $num1 es mayor o igual que $num2
fi

if [ $num1 -lt $num2 ]
then
    echo $num1 es menor que $num2
fi

if [ $num1 -le $num2 ]
then
    echo $num1 es menor o igual que $num2
fi

#!/bin/bash

echo "Por favor ingresa un numero: "
read num

if [ $num -gt 0 ]; then
  echo "$num es positivo"
elif [ $num -lt 0 ]; then
  echo "$num es negativo"
else
  echo "$num es cero"
fi

#!/bin/bash

assert_equals () {
  if [ "$1" = "$2" ]; then
    echo -e "$Green $Check_Mark Success $Color_Off"
  else
    echo -e "$Red Failed $Color_Off"
    echo -e "$Red Expected -$1- to equal -$2- $Color_Off"
    Errors=$((Errors  + 1))
    exit 1
  fi
}

response=$(./calc decimal 20 + 26)
assert_equals "$response" 46

response=$(./calc decimal 50 - 30)
assert_equals "$response" 20

response=$(./calc decimal 20 - 30)
assert_equals "$response" -10

response=$(./calc binario 01 + 100)
assert_equals "$response" 0000000000000101
#cuando hay overflow debido a que el resultado de la suma se pasa de los 16 bits. retorna un -1
response=$(./calc binario 1111111111111111 + 01)
assert_equals "$response" -1

response=$(./calc binario 0000000000000011 - 0000000000001010)
assert_equals "$response" -0000000000000111






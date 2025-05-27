#!/bin/bash

x=$1
y=$2

echo "x is $x"
echo "y is $y"
echo "Total= $(($x+$y))"

echo "The number of args entered is: $#"
echo "All entered are: $@"
echo "The script name is: $0"
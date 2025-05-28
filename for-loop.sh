#!/bin/bash


ID=$(id -u)
RED="\e[31m"  # Red color code
GREEN="\e[32m" # Green color code
NORMAL="\e[0m" # Normal code
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "Installation $package $RED Failed $NORMAL" 

else
    echo -e "Installation $package $GREEN Succeded $NORMAL"
}


if [ $ID -ne 0 ]
then
    echo -e "$RED Not a root user"
    exit 1
else
    echo -e "$GREEN You are a root user"
fi

#all args passed
#git java nginx python are the args

for package in $@ #first it will take git as first arg
do 
    yum list installed $package &>> $LOG_FILE #here it checks if git is installed, check with $? value
    if [ $? -ne 0 ] 
    then    
        yum install $package -y &>> $LOG_FILE
        VALIDATE() $?
    else 
        echo "$package is already installed"
    fi
done


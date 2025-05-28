#!/bin/bash

ID=$(id -u)
RED="\e[31m"  # Red color
GREEN="\e[32m" # Green color
NORMAL="\e[0m" # Reset color
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$(basename $0)-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installation $2 $RED Failed $NORMAL"
    else
        echo -e "Installation $2 $GREEN Succeeded $NORMAL"
    fi
}

if [ $ID -ne 0 ]; then
    echo -e "$RED Not a root user $NORMAL"
    exit 1
else
    echo -e "$GREEN You are a root user $NORMAL"
fi

for package in $@; do
    yum list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then    
        yum install $package -y &>> $LOG_FILE
        VALIDATE $? $package
    else 
        echo -e "$GREEN $package is already installed $NORMAL"
    fi
done

#!/bin/bash
ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Error:: $2 Failed"
        exit 1
    else
        echo "$2 Success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "You are not a root user"
    exit 1 #if exit=0, cmd will continue, if exit>0, cmd will exit
else    
    echo "You are a root user"
fi

dnf install nginx -y
VALIDATE $? "Installing nginx"

dnf install git -y
VALIDATE $? "Installling git"

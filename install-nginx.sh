#!/bin/bash

#first we need to verify the user is root 
ID=$(id -u) #id -u gives the value=0, if the user is a root user

if [$ID -ne 0]
then
    echo "You are not a root user"
    exit 1    # exit 1 means script exits here
else
    echo "You are a root user"
fi

dnf install nginx -y

#check whether nginx is installed properly, use special variable $?=0 if installation is crt

if [$? -ne 0]
    echo "Error: Installation failed"
    exit 1
else
    echo "Nginx Installation Success"
fi
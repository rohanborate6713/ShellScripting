#!/bin/bash

############################################
# Author: Rohan Borate
# Version : v0.0.1
# script is used to automate to get the list of resources that are used in aws 
# basically it comatins two arguments 
# 1. region
# 2. service 
#
#####################################

# check the required no of arguments are passed 

if [$# -ne2 ]; then
echo "Usages: ./aws_resource_list.sh <aws_region> <aws_service>"
echo "example: ./aws_resource_list.sh us-east-1 ec2"
exit 1
fi

# Assign the arguments to variables and convert the service to lowecase
aws_regin=$1
aws_service=$2

# check if the AWS CLI is configured
if [! -d ~/.aws ]; then
    echo "AWS CLI is not congigured. please configured the AWS CLI"
    exit 1
fi    

# List the resources based on the service 
# switch case is used 

case $aws_service in 
     ec2)
        echo "Listing EC2 instances in $aws_region"
        echo ec2 describe-instances --region $aws_regin
        ;;
    *)
        echo "invalid service. Please enter a valid service."
        exit 1
        ;;
esac        


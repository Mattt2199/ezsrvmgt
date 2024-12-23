#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#List all users besides services users
listallusers=$(sudo awk -F: '($3>=1000 && $3<=50000) {printf "%s:%s\n",$1,$3}' /etc/passwd)
echo "$listallusers"

#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Modify user password if exist
echo "Insert username:"
read modifyuserpassword
# Check if user exist
if sudo id -u "$modifyuserpassword" >/dev/null 2>&1; then
# If user exist ask for the new password cnd change it
	echo "Insert new user password:"
	read newuserpassword
	echo "$modifyuserpassword:$newuserpassword" | sudo chpasswd
	echo "$modifyuserpassword's password updated correctly!"
else
# Generate error if user does not exist and explain to the user which is the problem
	echo "-------------------- ERROR --------------------"
	echo "USER $deleteusername DOES NOT EXIST!"
	echo "-----------------------------------------------"
fi

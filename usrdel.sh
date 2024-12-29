#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Delete user if selected user exist
echo "Insert username:"
read deleteusername
# Check if user exist
if sudo id -u "$deleteusername" >/dev/null 2>&1; then
# If user exist delete the machine and the samba user but don't delete the user folder
	sudo userdel -f $deleteusername
	sudo smbpasswd -x $deleteusername
	sudo rm -rf /ezsrvshare/$deleteusername
	echo "$deleteusername correctly removed!"
else
# Generate error if user does not exist and explain to the user which is the problem
	echo "-------------------- ERROR --------------------"
	echo "USER $deleteusername DOES NOT EXIST!"
	echo "-----------------------------------------------"
fi

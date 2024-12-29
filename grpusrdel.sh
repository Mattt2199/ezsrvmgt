#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
echo "Insert username:"
read usertoremove
# Check if user exist
if sudo id -u "$usertoremove" >/dev/null 2>&1; then
	echo "Insert group name:"
	read groupremoved
	# Check if group exist
	if sudo getent group "$groupremoved" >/dev/null; then
	# If group exist, remove the user from the group
		sudo gpasswd -d $usertoremove $groupremoved
		echo "User $usertoremove removed from the group $groupremoved!"
	else
		# Generate error if group does not exist and explain to the user which is the problem
		echo "-------------------- ERROR --------------------"
		echo "GROUP $groupremoved DOES NOT EXIST!"
		echo "-----------------------------------------------"
	fi
else
	# Generate error if user does not exist and explain to the user which is the problem
	echo "-------------------- ERROR --------------------"
	echo "USER $usertoremove DOES NOT EXIST!"
	echo "-----------------------------------------------"
fi

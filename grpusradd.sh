#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Add user to a group if both exist
echo "Insert username:"
read usertoadd
# Check if user exist
if sudo id -u "$usertoadd" >/dev/null 2>&1; then
	echo "Insert group name:"
	read groupadded
# Check if group exist
	if sudo getent group "$groupadded" >/dev/null; then
	# If group exist, add the user to the group
		sudo usermod -a -G $groupadded $usertoadd
		echo "User $usertoadd added to the group $groupadded!"
	else
		# Generate error if group does not exist and explain to the user which is the problem
		echo "-------------------- ERROR --------------------"
		echo "GROUP $groupadded DOES NOT EXIST!"
		echo "-----------------------------------------------"
	fi
else
# Generate error if user does not exist and explain to the user which is the problem
	echo "-------------------- ERROR --------------------"
	echo "USER $usertoadd DOES NOT EXIST!"
	echo "-----------------------------------------------"
fi

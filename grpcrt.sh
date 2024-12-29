#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Create a group if it not exist
echo "Insert group name:"
read groupname
# Check if group already exist
if sudo getent group "$groupname" >/dev/null; then
	# Generate error if group exist and explain to the user which is the problem
	echo "-------------------- ERROR --------------------"
	echo "GROUP $groupname ALREADY EXIST!"
	echo "-----------------------------------------------"
else
	# If gorup does not exist, create the group
	sudo groupadd $groupname
	echo "$groupname correctly added!"
fi

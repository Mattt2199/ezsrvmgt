#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Delete a group if it exist
echo "Insert group name:"
read deletegroupname
# Check if group exist
if sudo getent group "$deletegroupname" >/dev/null; then
# If group exist, delete the group and maintain the users
	sudo groupdel $deletegroupname
	echo "$deletegroupname correctly removed!"
else
# Generate error if group does not exist and explain to the user which is the problem
	echo "-------------------- ERROR --------------------"
	echo "GROUP $deletegroupname DOES NOT EXIST!"
	echo "-----------------------------------------------"
fi

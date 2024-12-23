#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Create user and check if it doesn't exist already
echo "Insert username:"
read addusername
# Check if user already exist
if sudo id -u "$addusername" >/dev/null 2>&1; then
        # Generate error if user exist and explain to the user which is the problem
        echo "-------------------- ERROR --------------------"
        echo "USER $addusername ALREADY EXIST!"
        echo "-----------------------------------------------"
else
# If not exist, create the user, the password and the samba password
        sudo useradd -m -s /bin/bash $addusername
        echo "Insert password for user $addusername:"
        read adduserpass
        echo "$addusername:$adduserpass" | sudo chpasswd
        echo "$addusername correctly added!"
        (echo "$adduserpass"; echo "$adduserpass") | sudo smbpasswd -s -a "$addusername"
fi

#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Automatically update samba shares
sambaconfig="[global]
	workgroup = WORKGROUP
	server string = %h server
	log file = /var/log/samba/log.%m
	max log size = 1000
	logging = file
	panic action = /usr/share/samba/panic-action %d
	server role = standalone server
	obey pam restrictions = yes
	unix password sync = yes
	passwd program = /usr/bin/passwd %u
	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
	pam password change = yes
	map to guest = bad user
	usershare allow guests = no
[printers]
	comment = All Printers
	browseable = no
	path = /var/spool/samba
	printable = yes
	guest ok = no
	read only = yes
	create mask = 0700
[print$]
	comment = Printer Drivers
	path = /var/lib/samba/printers
	browseable = yes
	read only = yes
	guest ok = no
"
listallgroups=$(sudo awk -F: '($3>=1000 && $3<=50000) {printf "%s\n",$1}' /etc/group)
for group in $listallgroups
do
        if [ -d "/ezsrvshare/$group" ]; then
                echo "/ezsrvshare/$group directory already exist!"
        else
                sudo mkdir /ezsrvshare/$group
        fi
        sudo chown -R root:$group /ezsrvshare/$group
        sambaconfig+="[$group]
        writeable = yes
        comment = $group
        force user = root
        force group = $group
        create mask = 0770
        force create mode = 0770
        directory mask = 0770
        force directory mode = 0770
        path = /ezsrvshare/$group
        valid users = @$group
"
done
listallusers=$(sudo awk -F: '($3>=1000 && $3<=50000) {printf "%s\n",$1}' /etc/passwd)
for user in $listallusers
do
	if [ -d "/ezsrvshare/$user" ]; then
                echo "/ezsrvshare/$user directory already exist!"
        else
                sudo mkdir /ezsrvshare/$user
        fi
        sudo chown -R $user:root /ezsrvshare/$user
        sambaconfig+="[$user]
        writeable = yes
        comment = $user
        force user = $user
        force group = root
        create mask = 0770
        force create mode = 0770
        directory mask = 0770
        force directory mode = 0770
        path = /ezsrvshare/$user
        valid users = $user
"
done
echo "$sambaconfig" > '/etc/samba/smb.conf'
sudo systemctl restart smbd
sudo systemctl restart nmbd

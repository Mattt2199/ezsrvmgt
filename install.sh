#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Install, start and configure all packages and dependecies
apt install sudo -y
sudo apt install samba -y && sudo apt install samba-common -y && sudo apt install samba-common-bin -y && sudo apt install samba-libs -y && samba-vfs-modules -y
sudo apt install fail2ban -y
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
if [ -d "/ezsrvshare" ]; then
        echo "Share's directory already exist!"
else
        sudo mkdir /ezsrvshare
fi

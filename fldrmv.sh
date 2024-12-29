#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
#Delete a shared folder
echo "Insert folder name:"
read foldertoremove
sudo rm -rf /ezsrvshare/$foldertoremove

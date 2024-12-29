#!/bin/bash
#-------------------------------------------------------------------------------------------------------------------------
echo "Insert folder name:"
read foldertoremove
sudo rm -rf /ezsrvshare/$foldertoremove

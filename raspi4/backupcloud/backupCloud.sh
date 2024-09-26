#!/bin/bash

######## How to rclone a onedrive #######
##  https://jarrodstech.net/how-to-raspberry-pi-onedrive-sync/
######## How to encrypt #####
## https://szymonkrajewski.pl/encrypted-cloud-drive-rclone/
######## To restore files from encrypted onedrive:
### RESTORE
#rclone sync RB_Onedrive_enc:/raspi4/test.txt /home/pi/ralf_raspi/raspi4_restore --config /home/pi/ralf_raspi/raspi4/backupcloud/rclone.conf --log-file=/home/pi/ralf_raspi/raspi4/backupcloud/RCLONE_restore.log

### sudo apt-get install rclone
#RB_onedrive_enc:AmpiODENC2308:080400e

mountpath=/mnt/BaerNasBackup
path_to_log=$mountpath/Raspberry/nasbackup/
logfile=RCLONE.log
path_to_clone=$mountpath/Dokumente

exec > $path_to_log$logfile  2>&1

echo "$0 started: " `date +%Y-%m-%d_%H:%M`



echo "start new rclone " `date +%Y-%m-%d_%H:%M`


rclone sync $mountpath/Dokumente RB_Onedrive_enc:/Dokumente --config $path_to_log/rclone.conf --log-file=$path_to_log/RCLONE_Dokumente.log --log-level=INFO & 
rclone sync $mountpath/Bilder RB_Onedrive_enc:/Dokumente --config $path_to_log/rclone.conf --log-file=$path_to_log/RCLONE_Bilder.log --log-level=INFO & 


echo "finished rclone sync " `date +%Y-%m-%d_%H:%M`

echo "Finished "  `date +%Y-%m-%d_%H:%M`
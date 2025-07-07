#!/bin/bash

#mountpath_backuptarget=/mnt/SSD240/backup
mountpath_backuptarget=/mnt/FB_nas/backup
mkdir -p mountpath_backuptarget
mountpath_tosave=/mnt/BaerNas

path_to_log=$mountpath_tosave/Raspberry/nasbackup/

logfile=$path_to_log/RCLONE_LocalBackup.log
exec > $logfile  2>&1

echo "$0 started: " `date +%Y-%m-%d_%H:%M`



echo "start new rclone " `date +%Y-%m-%d_%H:%M`


rclone sync $mountpath_tosave/Dokumente $mountpath_backuptarget/Dokumente --log-file=$logfile.dokumente.log --log-level=INFO --size-only & 
rclone sync $mountpath_tosave/Bilder $mountpath_backuptarget/Bilder --log-file=$logfile.bilder.log --log-level=INFO --size-only & 


echo "finished rclone sync " `date +%Y-%m-%d_%H:%M`

echo "Finished "  `date +%Y-%m-%d_%H:%M`

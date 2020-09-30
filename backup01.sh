#!/bin/bash

#Mikrotik Backup Script By Aldhiansyah
#Created 10 September 2020
own='adminer'
addr='10.10.10.1'
flk="/root/key.mtk"

if [ ! -d /root/BACKUP-MIKROTIK/Mikrotik_Kota-$(date +%d-%m-%Y) ]; then
     mkdir -p /root/BACKUP-MIKROTIK/Mikrotik_Kota-$(date +%d-%m-%Y);
fi;
sshpass -f $flk ssh $own@$addr 'export file=Backup-NOW.rsc'
sleep 5
sshpass -f $flk ssh $own@$addr '/system backup save name=Backup-NOW'
sleep 3
sshpass -f $flk scp -r adminer@10.10.10.1:/Backup-NOW.rsc /root/BACKUP-MIKROTIK/Mikrotik_Kota-$(date +%d-%m-%Y)/UPT-Kota.rsc
sleep 3
sshpass -f $flk scp -r adminer@10.10.10.1:/Backup-NOW.backup /root/BACKUP-MIKROTIK/Mikrotik_Kota-$(date +%d-%m-%Y)/UPT-Kota.backup
sleep 3
sshpass -f $flk ssh $own@$addr '/file remove Backup-NOW.rsc'
sleep 3 
sshpass -f $flk ssh $own@$addr '/file remove Backup-NOW.backup'


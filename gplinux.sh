#!/bin/bash
pblink=$(cat /etc/gplinux/playbooks.link)
date>>/var/log/gplinux.log
date>>/var/log/gplinux.error.log
wget -O /etc/gplinux/playbooks $pblink 1>>/var/log/gplinux.log 2>>/var/log/gplinux.error.log
lnks=$(cat /etc/gplinux/playbooks)
for line in $lnks
do
wget -O /etc/gplinux/playbook.yml $line 1>>/var/log/gplinux.log 2>>/var/log/gplinux.error.log
ansible-playbook --connection=local /etc/gplinux/playbook.yml 1>>/var/log/gplinux.log 2>>/var/log/gplinux.error.log
done

#!/bin/bash
pblink=$(cat /etc/gplinux/playbooks.link)
date>>/var/log/gplinux.error.log
wget -O /etc/gplinux/playbooks $pblink 2>>/var/log/gplinux.error.log
lnks=$(cat /etc/gplinux/playbooks)
for line in $lnks
do
wget -O /etc/gplinux/playbook.yml $line 2>>/var/log/gplinux.error.log
ansible-playbook --connection=local /etc/gplinux/playbook.yml 2>>/var/log/gplinux.error.log
done

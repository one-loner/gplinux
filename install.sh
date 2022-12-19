#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
mkdir /etc/gplinux
touch /var/log/gplinux.log
touch /var/log/gplinux.error.log
apt-get install -y ansible wget less
cp gplinux.sh /bin/gplinux
chmod +x /bin/gplinux
cp gpupdate.sh /bin/gpupdate
chmod +x /bin/gpupdate
cp gplog.sh /bin/gplog
chmod +x /bin/gplog
echo "Enther link to playbook list:"
read a
echo $a > /etc/gplinux/playbooks.link
echo '*/15 * * * * root /bin/gplinux' >>/etc/crontab
systemctl restart cron

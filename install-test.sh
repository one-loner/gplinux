#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
mkdir /etc/gplinux
touch /var/log/gplinux.log
touch /var/log/gplinux.error.log
apt-get install -y ansible wget less apache2
cp gplinux.sh /bin/gplinux
chmod +x /bin/gplinux
cp gpupdate.sh /bin/gpupdate
chmod +x /bin/gpupdate
cp gplog.sh /bin/gplog
chmod +x /bin/gplog
cp playbooks.list /var/www/html/
cp playboook.yml /var/www/html/
cp playbook1.yml /var/www/html/
chown -R www-data:www-data /var/www/html
echo '*/15 * * * * root /bin/gplinux' >>/etc/crontab
systemctl restart cron

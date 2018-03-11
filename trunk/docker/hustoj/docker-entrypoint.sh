#!/bin/bash

DIRECTORY="/data/data/"
if [ ! -d $DIRECTORY ]; then
	cp -R /home/judge/data/ /data/
fi
mount --bind $DIRECTORY /home/judge/data

DIRECTORY="/data/etc/"
if [ ! -d $DIRECTORY ]; then
	cp -R  /home/judge/etc/ /data/
fi
mount --bind $DIRECTORY /home/judge/etc

DIRECTORY="/data/upload"
if [ ! -d $DIRECTORY ]; then
	cp -R  /home/judge/src/web/upload /data
fi
mount --bind $DIRECTORY /home/judge/src/web/upload

DIRECTORY="/data/config"
if [ ! -d $DIRECTORY ]; then
	cp -R  /home/judge/src/web/config /data
fi
mount --bind $DIRECTORY /home/judge/src/web/config

DIRECTORY="/data/mysql"
if [ ! -d $DIRECTORY ]; then
	cp -R /var/lib/mysql /data
fi
mount --bind $DIRECTORY /var/lib/mysql

if [  -f "/data/judge.conf" ]; then
	mv /data/judge.conf /data/etc
fi

chmod 775 -R /data/data 
chgrp -R www-data /data/data
chmod 770 -R 		/data/upload /data/config 
chgrp -R www-data 	/data/upload /data/config 
chown -R mysql:mysql /data/mysql/

if grep "OJ_MARKET_ENABLE" /data/config/system.conf.php ; then
	echo "OJ_MARKET_ENABLE added!"
else
	sed -i '/OJ_MARKET_PASSWORD = "e10adc3949ba59abbe56e057f20f883e"/a\OJ_MARKET_ENABLE = 0' /data/config/system.conf.php
fi

service mysql start
/usr/bin/judged
php5-fpm
service nginx start

/bin/bash  
exit 0 



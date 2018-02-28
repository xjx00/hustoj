#!/bin/bash

DIRECTORY="/data/data/"
if [ ! -d $DIRECTORY ]; then
	cp -R /home/judge/data/ /data/
fi
chmod 775 -R /data/data 
chgrp -R www-data /data/data
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
chmod 770 -R 		/data/upload
chgrp -R www-data 	/data/upload  
mount --bind $DIRECTORY /home/judge/src/web/upload

DIRECTORY="/data/config"
if [ ! -d $DIRECTORY ]; then
	cp -R  /home/judge/src/web/config /data
fi
chmod 770 -R 		/data/config 
chgrp -R www-data 	/data/config 
mount --bind $DIRECTORY /home/judge/src/web/config

DIRECTORY="/data/mysql"
if [ ! -d $DIRECTORY ]; then
	cp -R /var/lib/mysql /data
fi
chown -R mysql:mysql /data/mysql/
mount --bind $DIRECTORY /var/lib/mysql

service mysql start
/usr/bin/judged
php5-fpm
service nginx start

/bin/bash  
exit 0 



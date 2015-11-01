#! /bin/sh

cd /sickbeard

if [ -f /config/config.ini ]
then
	rm -rf /sickbeard/config.ini
	rm -rf /sickbeard/sickbeard.db
else
	mv -f /sickbeard/config.ini /config/config.ini
fi
ln -sf /config/config.ini /sickbeard/
ln -sf /config/sickbeard.db /sickbeard/sickbeard.db

exec /usr/bin/python2 SickBeard.py

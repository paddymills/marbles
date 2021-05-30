#!/bin/sh

cp config/sublevel-lime /etc/nginx/sites-enabled/sublevel-lime
cp config/sublevel-lime.service /etc/systemd/system/

mkdir /var/www/sublevel-lime
cp -r flask/landr/* /var/www/sublevel-lime/

systemctl start sublevel-lime
systemctl enable sublevel-lime

systemctl restart nginx

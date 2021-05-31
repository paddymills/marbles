#!/bin/sh

# python src
mkdir /var/www/sublevel-lime
cp -r flask/landr/* /var/www/sublevel-lime/

# gunicorn
cp config/sublevel-lime.service /etc/systemd/system/
systemctl start sublevel-lime
systemctl enable sublevel-lime

# nginx
cp config/sublevel-lime /etc/nginx/sites-available/sublevel-lime
ln -s /etc/nginx/sites-available/sublevel-lime /etc/nginx/sites-enabled
systemctl restart nginx

#!/usr/bin/env bash

# Update APT database
sudo apt-get update -y

# Useful tools
sudo apt-get install -y vim git curl gettext build-essential unzip

# Dependencies for PIL
sudo apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev

# Redis
sudo apt-get install -y redis-server

# PostgreSQL
sudo apt-get install -y postgresql libpq-dev

# Create vagrant pgsql superuser
sudo -u postgres createuser --superuser vagrant
sudo -u postgres psql -c "ALTER USER vagrant WITH PASSWORD 'vagrant';"

# Java for Elasticsearch
sudo apt install -y openjdk-7-jre-headless

# Elasticsearch
wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.7.1.deb
dpkg -i elasticsearch-1.7.1.deb
systemctl enable elasticsearch
systemctl start elasticsearch
rm elasticsearch-1.7.1.deb

# Python 2.7
sudo apt-get install -y python python-dev

# Python 3.4
sudo apt-get install -y python3 python3-dev

# Python tools
sudo apt-get install -y python3-pip fabric python-sphinx
pip3 install virtualenv
pip3 install wagtail

# Cleanup
apt-get remove -y libllvm3.4
apt-get autoremove -y
apt-get clean
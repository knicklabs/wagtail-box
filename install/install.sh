# Update APT database
sudo apt-get update -y

# Useful tools
sudo apt-get install -y vim git curl gettext build-essential

# Dependencies for PIL
sudo apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev

# Redis
sudo apt-get install -y redis-server

# PostgreSQL
sudo apt-get install -y postgresql libpq-dev

# Create vagrant pgsql superuser
sudo -u postgres createuser --superuser vagrant

# Java for Elasticsearch
sudo apt install -y openjdk-7-jre openjdk-7-jdk

# Elasticsearch
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.3.3.deb
sudo dpkg -i elasticsearch-2.3.3.deb
sudo update-rc.d elasticsearch defaults

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
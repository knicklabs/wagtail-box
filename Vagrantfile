# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  # Source code
  config.vm.synced_folder "vagrant/", "/vagrant"

  # Wagtail app server
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  # PostgreSQL
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  # Redis
  config.vm.network "forwarded_port", guest: 6379, host: 6379

  # ElasticSearch
  config.vm.network "forwarded_port", guest: 9200, host: 9200

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.name = "wagtail"
  end

  config.vm.provision :shell, path: "install/install.sh"
end



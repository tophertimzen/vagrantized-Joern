# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  #ubuntu 14.04
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
 
  #Neo4J database for joern
  config.vm.network "forwarded_port", guest: 7474, host: 7474

  #provision VM
  config.ssh.username = 'vagrant'
  config.vm.provision :shell, :path => "setup.sh", :privileged => false

  #Place files you want to link to database in this folder
  config.vm.synced_folder "codeDirectory", "/home/vagrant/codeDirectory"


  #virtual box settings
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Joern"
  end

end

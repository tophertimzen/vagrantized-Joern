#Joern Vagrant Box

This Vagrant box contains [Joern](https://github.com/fabsx00/joern), A robust parser for C/C++ storing abstract syntax trees, control flow graphs and program dependence graphs in a neo4j graph database, pre-installed with all needed dependancies. 

##Install VirtualBox

Check [Virtualbox](https://www.virtualbox.org/wiki/Downloads) for information on installing Virtualbox on your respective operating system.

##Install Vagrant

Check [VagrantUp](http://www.vagrantup.com/downloads.html) for information on installing vagrant.

##Fire up the VM

1) 

```
https://github.com/tophertimzen/vagrantized-Joern.git
cd vagrantized-Joern
mkdir codeDirectory
vagrant up
vagrant ssh
```

2)

```
cd /opt/joern-0.3.1
ant && ant tools
```

###Code Directory

codeDirectory should contain the code you want to perform static analysis on with Joern. 

```
joern /home/vagrant/codeDirectory
$Neo4jDir/bin/neo4j console &
```

###Test to Ensure Everything is Setup Properly

Run this after VM is provisioned and you are connected to it via 'vagrant ssh.'

Pre-populated with an example from [praetorian](https://www.praetorian.com/blog/why-you-should-add-joern-to-your-source-code-audit-toolkit). 

```
cd ~
curl https://gist.githubusercontent.com/tophertimzen/26e089714c010ef44c3d4ad4398e2649/raw/e932cfcc53e5e412e3ca2ad0f4c8f54f1dadb3b8/joern%2520test --create-dirs -o /home/vagrant/joernTest/test.py
curl https://gist.githubusercontent.com/anonymous/ad1f389075e40841e0f8/raw/5f1dcc8df43b5e4b3066f87dab4c4e61fe839e54/vulnerable.c -create-dirs -o /home/vagrant/codeDirectory/vulnerable.c
joern /home/vagrant/codeDirectory
$Neo4jDir/bin/neo4j console &
```

Wait a minute and then

```
python /home/vagrant/joernTest/test.py
```

http://localhost:7474/ will also contain a Neo4J server web interface when Neo4J is running. 

###Joern

Fore more information on joern visit the [documentation](http://joern.readthedocs.io/en/latest/) page.

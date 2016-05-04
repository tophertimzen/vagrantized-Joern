#!/bin/bash

INSTALLDIR=/opt/
JOERN=/opt/joern-0.3.1
sudo chmod 777 -R /opt
echo 'source  ~/.aliases' >> ~/.bashrc
chmod 777 ~/.aliases

#Updates
sudo apt-get -y update

#Dependancies
sudo apt-get -y install git
sudo apt-get -y install zsh
sudo apt-get -y install python-setuptools python-dev
sudo apt-get -y install graphviz libgraphviz-dev graphviz-dev
sudo apt-get -y install pkg-config
sudo apt-get -y install ant
sudo apt-get -y install unzip
sudo apt-get -y install openjdk-7-jre 
sudo apt-get -y install openjdk-7-jdk
sudo apt-get -y install python-pip

#Building joern
cd $INSTALLDIR
wget https://github.com/fabsx00/joern/archive/0.3.1.tar.gz
tar xfzv 0.3.1.tar.gz
cd joern-0.3.1
wget http://mlsec.org/joern/lib/lib.tar.gz
tar xfzv lib.tar.gz
cd lib/
sudo ant
sudo ant tools
echo "alias joern='java -jar /opt/joern-0.3.1/bin/joern.jar'" >> ~/.aliases
source ~/.aliases

#Neo4j 2.1.8
cd $INSTALLDIR
wget http://neo4j.com/artifact.php?name=neo4j-community-2.1.8-unix.tar.gz
tar -zxvf artifact.php\?name\=neo4j-community-2.1.8-unix.tar.gz
export Neo4jDir='/opt/neo4j-community-2.1.8/'
echo "export Neo4jDir='/opt/neo4j-community-2.1.8/'" >> ~/.bashrc
wget http://mlsec.org/joern/lib/neo4j-gremlin-plugin-2.1-SNAPSHOT-server-plugin.zip
unzip neo4j-gremlin-plugin-2.1-SNAPSHOT-server-plugin.zip -d $Neo4jDir/plugins/gremlin-plugin

#Python-Joern
cd $INSTALLDIR
git clone https://github.com/fabsx00/python-joern.git
sudo pip install py2neo
cd python-joern
sudo python2 setup.py install

#Joern-Tools
cd $INSTALLDIR
git clone https://github.com/fabsx00/joern-tools
sudo pip install pygraphviz
cd joern-tools
sudo python2 setup.py install

#Setup Database
sed -i 's/data\/graph.db/\/home\/vagrant\/.joernIndex\//g' /opt/neo4j-community-2.1.8/conf/neo4j-server.properties
echo "alias joernDB='$Neo4jDir/bin/neo4j console &'" >> ~/.aliases

#!/bin/bash

# Installs python & kafka
echo "Starting download and installation of kafka"
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get -y  install default-jre
sudo apt-get -y install default-jdk
sudo apt-get -y install python-dev python-virtualenv
wget http://www.trieuvan.com/apache/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz
tar -xvf kafka_2.10-0.8.2.0.tgz
echo "Install Done"
cd kafka_2.10-0.8.2.0
./bin/zookeeper-server-start.sh ./config/zookeeper.properties & ./bin/kafka-server-start.sh ./config/server.properties
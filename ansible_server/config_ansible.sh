#!/bin/sh

############################################################################
# Install Python, Virtualenv, postgres, nginx, git, supervisor and ansible
############################################################################

sudo apt-get update
echo "Y" | sudo apt-get upgrade
echo "Y" | sudo apt-get install python-virtualenv
echo "Y" | sudo apt-get install libpq-dev python-dev
echo "Y" | sudo apt-get install postgresql postgresql-contrib
echo "Y" | sudo apt-get install nginx
echo "Y" | sudo apt-get install git-core
echo "Y" | sudo apt-get install supervisor

# Install Ansible
echo "\n" | sudo apt-add-repository ppa:ansible/ansible
echo "Y" | sudo apt-get install software-properties-common


# Create SSH Key
ssh-keygen -t rsa -N "" -f /root/.ssh/main_rsa
ssh-add /root/.ssh/main_rsa
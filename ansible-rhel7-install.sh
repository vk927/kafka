#!/bin/bash
sudo yum install wget
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -ivh epel-release-7-5.noarch.rpm
sudo yum install ansible
echo
echo
echo "-----------------------------------------------"
echo "-----------------------------------------------"
echo " changing the permissions of the  keys directory recursively to 700 to restrict  ssh clients private key  ---"
sudo chmod -R 700 keys

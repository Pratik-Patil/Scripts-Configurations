#!/bin/bash
# Program: Apache Installation Script for RHEL
# Developer: Pratik Patil
# Date: 29-June-2016
# Last Updated: 29-June-2016

yum -y install httpd vim mlocate redhat-lsb openssl-devel openssh-server gcc make policycoreutils-python; 
yum -y groupinstall 'Development Tools'; updatedb; setenforce 0;
mkdir -p /install/softwareRepo/test; chmod -R 777 /install/;
rm -rf /etc/httpd/conf/httpd.conf /etc/httpd/conf.d/welcome.conf;
wget -P /etc/httpd/conf/ https://raw.githubusercontent.com/Pratik-Patil/Scripts-Configurations/master/configuration-files/httpd.conf;
service httpd restart;

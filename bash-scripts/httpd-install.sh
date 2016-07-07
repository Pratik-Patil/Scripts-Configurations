#!/bin/bash
# Program: Apache Installation Script for RHEL
# Developer: Pratik Patil
# Date: 29-June-2016
# Last Updated: 07-July-2016


yum -y install httpd vim mlocate redhat-lsb openssl-devel openssh-server gcc make policycoreutils-python; 
yum -y groupinstall 'Development Tools'; updatedb; setenforce 0;

mkdir -p /install/softwareRepo/test; chmod -R 777 /install/;
rm -rf /etc/httpd/conf/httpd.conf /etc/httpd/conf.d/welcome.conf;

major_version=$(lsb_release -rs | cut -f1 -d.);

if [ "$major_version" -eq 6 ];
then
	wget -P /etc/httpd/conf/ https://raw.githubusercontent.com/Pratik-Patil/Scripts-Configurations/master/configuration-files/RHEL_6.x/httpd.conf;
	
elif[ "$major_version" -eq 7 ]
then
	wget -P /etc/httpd/conf/ https://raw.githubusercontent.com/Pratik-Patil/Scripts-Configurations/master/configuration-files/RHEL_7.x/httpd.conf;
	firewall-cmd --zone=public --add-port=8888/tcp --permanent && firewall-cmd --reload;

else
	echo "UnSupported Operating System";
fi

service httpd restart;

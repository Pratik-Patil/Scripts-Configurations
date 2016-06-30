#!/bin/bash
# Program: Chef Server UnInstallation Script for RHEL
# Developer: Pratik Patil
# Date: 30-June-2016
# Last Updated: 30-June-2016


rm -rf /opt/chef; rm -rf /etc/chef; 
for P in /usr/bin/chef-*; do [ -e "$P" ] && sudo rm -f "$P"; done
rpm -qa | grep chef-server | xargs yum erase -y;
userdel -f chef_server; userdel -f opscode-pgsql; 
rm -rf /usr/bin/knife /usr/bin/ohai /usr/bin/chef; /opt/chef-server/ /var/chef/ /var/opt/chef-server/ /var/log/chef-server/ /etc/chef /etc/chef-server/ /etc/chef /etc/chef-server/;

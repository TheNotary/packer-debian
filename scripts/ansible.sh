#!/bin/bash

# Ansible prequesites
apt-get -y install python ruby ruby-json facter ohai

# Install Ansible
apt-get -y install ansible
touch /var/log/ansible.log
chown vagrant. /var/log/ansible.log

#!/usr/bin/env bash

sudo apt-get -y update

sudo apt-get install -y apache2 curl git libmysqlclient-dev nodejs

# Install mysqlserver and force it to accept the passwords so it doesn't pop-up a gui.
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password oranges465'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password oranges465'
sudo apt-get -y install mysql-server

# Import the key for RVM.
gpg --import /vagrant/supporting/mpapis.asc

# Install RVM.
curl -sSL https://get.rvm.io | bash -s stable

# Append the public ssh key for bit bucket into known hosts to allow us to connect.
cat /vagrant/supporting/bitbucket_keys  >> ~/.ssh/ssh_known_hosts

cat /vagrant/supporting/ssh-for-bitbucket  >> ~/.ssh/ssh-for-bitbucket

cat /vagrant/supporting/config  >> ~/.ssh/config

# Note to self: some background reading material:
# Tips and stuff: https://www.debian-administration.org/article/503/How_do_you_manage_your_SSH_host_keys
# The RVM install issue: https://github.com/rvm/rvm/issues/3110

# N.b. part of the reason for splitting up these scripts is that some things like paths need
# to be reloaded and 'source' doesn't seem to do that in this case but splitting up into
# different scripts, does.
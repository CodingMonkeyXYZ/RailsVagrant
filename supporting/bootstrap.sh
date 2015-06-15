function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1



install apache2 curl git libmysqlclient-dev nodejs

# Install mysqlserver and force it to accept the passwords so it doesn't pop-up a gui.
debconf-set-selections <<< 'mysql-server mysql-server/root_password password oranges465'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password oranges465'
install mysql-server

install Ruby ruby2.2 ruby2.2-dev

# install gems
gem install rails 

# Append the public ssh key for bit bucket into known hosts to allow us to connect.
cat /vagrant/supporting/bitbucket_keys  >> ~/.ssh/ssh_known_hosts

cat /vagrant/supporting/ssh-for-bitbucket  >> ~/.ssh/ssh-for-bitbucket

cat /vagrant/supporting/config  >> ~/.ssh/config

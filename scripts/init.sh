#!/bin/bash
wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
yum -y install erlang

#download rpm if not present
if [ ! -f /vagrant/rpm/rabbitmq-server-3.2.3-1.noarch.rpm ]; then
    echo Downloading rabbitmq...
    wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.2.3/rabbitmq-server-3.2.3-1.noarch.rpm -P /vagrant/rpm/
fi

#disabling iptables
/etc/init.d/iptables stop

echo installing rabbitmq...
rpm -ivh /vagrant/rpm/rabbitmq-server-3.2.3-1.noarch.rpm
echo done installing rabbitmq
# copy .erlang.cookie
mkdir /var/lib/rabbitmq
chown rabbitmq:rabbitmq /var/lib/rabbitmq
cp /vagrant/config/.erlang.cookie /var/lib/rabbitmq/.erlang.cookie
chmod 400 /var/lib/rabbitmq/.erlang.cookie
chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
# chmod scripts
chmod u+x /vagrant/scripts/*.sh
# start rabbitmq
/sbin/service rabbitmq-server start

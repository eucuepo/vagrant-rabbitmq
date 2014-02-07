#!/bin/bash
yum -y install haproxy

# copy haproxy cfg 
if [ ! -d /etc/haproxy ]; then
 mkdir /etc/haproxy
fi

cp /vagrant/config/haproxy.cfg /etc/haproxy/haproxy.cfg
# copy haproxy log config
cp /vagrant/config/haproxy.conf /etc/rsyslog.d/haproxy.conf
# restart rsyslog
/etc/init.d/rsyslog restart
#chown rabbitmq:rabbitmq /var/lib/rabbitmq
chkconfig haproxy on
# chmod scripts
chmod u+x /vagrant/scripts/*.sh
# start haproxy
/etc/init.d/haproxy restart 

#!/bin/bash

#disabling iptables
/etc/init.d/iptables stop

# chmod scripts
chmod u+x /vagrant/scripts/*.sh

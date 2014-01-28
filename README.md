vagrant-rabbitmq
=============

Vagrant config to setup a clustered three node rabbitmq installation

This configuration will start and provision 3 CentOS6 VMs.

Each host is provisioned with Erlang and RabbitMQ

Prerrequisites
-------------------------
* Vagrant
* VirtualBox

Setup
-------------------------

RabbitMQ requires host short names for all nodes to be set up in /etc/hosts. To automatically let Vagrant do this, install the plugin vagrant-hostmanager:

```$ vagrant plugin install vagrant-hostmanager```

To manually set the local /etc/host files, run:

```$ vagrant hostmanager```

To start it up, just git clone this repo and execute ```vagrant up```. Takes a while the first time as it will download all required dependencies for you.

RabbitMQ is installed on ```/usr/local/rabbitmq```

Let's test it!
-------------------------

Login to any host with ```vagrant/vagrant```.

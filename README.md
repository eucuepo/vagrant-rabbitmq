vagrant-rabbitmq
=============

Vagrant config to setup a clustered three node rabbitmq installation

This configuration will start and provision 3 CentOS6 VMs.

Each host is provisioned with Erlang and RabbitMQ

Prerrequisites
-------------------------
* [Vagrant](http://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)
* [Puppet](http://puppetlabs.com/)
* [Librarian-puppet](http://librarian-puppet.com/)

Setup
-------------------------

RabbitMQ requires host short names for all nodes to be set up in /etc/hosts. To automatically let Vagrant do this, install the plugin vagrant-hostmanager:

```$ vagrant plugin install vagrant-hostmanager```

To manually set the local /etc/host files, run:

```$ vagrant hostmanager```

Vagrant-cachier is a plugin that enables caching content for Vagrant boxes, to enable it execute:

```$ vagrant plugin install vagrant-cachier```

RabbitMQ puppet modules are needed for this installation, to download them execute:

```$ librarian-puppet install```

To start it up, git clone this repo and execute ```vagrant up```. Takes a while the first time as it will download all required dependencies for you.

RabbitMQ is installed on ```/usr/lib/rabbitmq```

Let's test it!
-------------------------

Login to any host with ```vagrant/vagrant```.

Execute:

```$ sudo /usr/sbin/rabbitmqctl cluster_status```

This will show the cluster status, it should be similar to:

```
Cluster status of node rabbit@rabbit1 ...
[{nodes,[{disc,[rabbit@rabbit1,rabbit@rabbit3]},{ram,[rabbit@rabbit2]}]},
 {running_nodes,[rabbit@rabbit3,rabbit@rabbit2,rabbit@rabbit1]}]
...done.
```

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.ssh.forward_agent = true
  config.vm.provision "shell", path: "scripts/init.sh"
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  # configure rabbitmq cluster
  (1..3).each do |i|
    config.vm.define "rabbitmq#{i}" do |s|
      s.vm.hostname = "rabbitmq#{i}"
      s.vm.network "public_network", use_dhcp_assigned_default_route: true
      s.vm.network "private_network", ip: "10.30.3.#{i+1}", netmask: "255.255.255.0", virtualbox__intnet: "servidors", drop_nat_interface_default_route: true
      s.vm.provision "shell", path: "scripts/rabbitmq#{i}.sh"
    end
  end

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
end


# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    # If you are using VirtualBox, you might want to enable NFS for shared folders
    # config.cache.enable_nfs  = true
  end

  config.vm.box = "centos64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.ssh.forward_agent = true
  
  # Hostmanager config
  config.vm.provision :hostmanager
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
 
  # disable firewall 
  config.vm.provision "shell", path: "scripts/firewall.sh"

  # configure rabbitmq cluster
  (1..3).each do |i|
    config.vm.define "rabbitmq#{i}" do |s|
      s.vm.hostname = "rabbitmq#{i}"
      s.vm.network "public_network", :bridge => 'en1: Wi-Fi (AirPort)', use_dhcp_assigned_default_route: true
      s.vm.network "private_network", ip: "10.30.3.#{i+1}", netmask: "255.255.255.0", virtualbox__intnet: "servidors", drop_nat_interface_default_route: true
      s.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file = "site.pp"
      end
    end
  end
  

  #Configure HA Proxy
  config.vm.define "haproxy" do |s|
      s.vm.hostname = "haproxy"
      s.vm.network "public_network",:bridge => 'en1: Wi-Fi (AirPort)', use_dhcp_assigned_default_route: true
      s.vm.network "private_network", ip: "10.30.3.50", netmask: "255.255.255.0", virtualbox__intnet: "servidors", drop_nat_interface_default_route: true
      s.vm.provision "shell", path: "scripts/haproxy.sh", privileged: "true"
    end

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
end


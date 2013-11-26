# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-13.10-amd64"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  # Setup Openstack Controller
  config.vm.define "controller" do |controller|
    controller.vm.hostname = "controller"

    controller.vm.provider :virtualbox do |vb|
      vb.name = "openstack-controller"
      vb.customize ["modifyvm", :id, "--memory", "3072"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
      vb.customize ["modifyvm", :id, "--nic2", "bridged", "--bridgeadapter2", "eth0"]
      vb.customize ["modifyvm", :id, "--nic3", "hostonly", "--hostonlyadapter3", "vboxnet0"]
      
      if not File.exist?('drives/gluster_brick1.vdi')
        vb.customize ["createhd", "--filename", "drives/gluster_brick1.vdi", "--size", "512000"]
        vb.customize ["storagectl", :id, "--name", "SATA Controller", "--add", "sata", "--controller", "IntelAHCI"]
        vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "0", "--device", "0", "--type", "hdd", "--medium", "drives/gluster_brick1.vdi"]
      end 
    end

    controller.vm.provision "shell", path: "config/controller.interfaces.sh"
    controller.vm.provision "shell", path: "config/hosts.sh"
    controller.vm.provision "shell", path: "scripts/networking.sh"
    controller.vm.provision "shell", path: "scripts/openstack-prep.sh"
    controller.vm.provision "shell", path: "scripts/passwords.sh"
    controller.vm.provision "shell", path: "scripts/glusterfs-prep.sh"
    controller.vm.provision "shell", path: "scripts/mysql-server.sh"
    controller.vm.provision "shell", path: "scripts/rabbitmq.sh"
    controller.vm.provision "shell", path: "scripts/keystone-prep.sh"
    controller.vm.provision "shell", path: "config/keystone.conf.sh"
    controller.vm.provision "shell", path: "scripts/keystone-configuration.sh"
    controller.vm.provision "shell", path: "scripts/glance-prep.sh"
    controller.vm.provision "shell", path: "config/glance-api.conf.sh"
    controller.vm.provision "shell", path: "config/glance-api-paste.ini.sh"
    controller.vm.provision "shell", path: "config/glance-registry.conf.sh"
    controller.vm.provision "shell", path: "config/glance-registry-paste.ini.sh"
    controller.vm.provision "shell", path: "scripts/glance-configuration.sh"
    controller.vm.provision "shell", path: "scripts/controller.compute-prep.sh"
    controller.vm.provision "shell", path: "config/controller.nova.conf.sh"
    controller.vm.provision "shell", path: "config/compute-api-paste.ini.sh"
    controller.vm.provision "shell", path: "scripts/controller.compute-configuration.sh"
    controller.vm.provision "shell", path: "scripts/controller.nova-network.sh"
  end

  # Setup OpenStack Compute Node 1
  config.vm.define "compute1" do |compute1|
    compute1.vm.hostname = "compute1"

    compute1.vm.provider :virtualbox do |vb|
      vb.name = "openstack-compute1"
      vb.customize ["modifyvm", :id, "--memory", "4048"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
      vb.customize ["modifyvm", :id, "--nic2", "bridged", "--bridgeadapter2", "eth0"]
      vb.customize ["modifyvm", :id, "--nic3", "hostonly", "--hostonlyadapter3", "vboxnet0"]

      if not File.exist?('drives/gluster_brick2.vdi')
        vb.customize ["createhd", "--filename", "drives/gluster_brick2.vdi", "--size", "512000"]
        vb.customize ["storagectl", :id, "--name", "SATA Controller", "--add", "sata", "--controller", "IntelAHCI"]
        vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "0", "--device", "0", "--type", "hdd", "--medium", "drives/gluster_brick2.vdi"]
      end
    end

    compute1.vm.provision "shell", path: "config/compute1.interfaces.sh"
    compute1.vm.provision "shell", path: "scripts/networking.sh"
    compute1.vm.provision "shell", path: "config/hosts.sh"
    compute1.vm.provision "shell", path: "config/ntp.conf.sh"
    compute1.vm.provision "shell", path: "scripts/openstack-prep.sh"
    compute1.vm.provision "shell", path: "scripts/glusterfs-prep.sh"
    compute1.vm.provision "shell", path: "scripts/dbus.sh"
    compute1.vm.provision "shell", path: "scripts/mysql-client.sh"
    compute1.vm.provision "shell", path: "scripts/compute-prep.sh"
    compute1.vm.provision "shell", path: "config/compute1.nova.conf.sh"
    compute1.vm.provision "shell", path: "config/nova-compute.conf.sh"
    compute1.vm.provision "shell", path: "config/compute-api-paste.ini.sh"
    compute1.vm.provision "shell", path: "scripts/compute-configuration.sh"
    compute1.vm.provision "shell", path: "scripts/compute.nova-network.sh"
  end

  # Setup OpenStack Compute Node 2
  config.vm.define "compute2" do |compute2|
    compute2.vm.hostname = "compute2"

    compute2.vm.provider :virtualbox do |vb|
      vb.name = "openstack-compute2"
      vb.customize ["modifyvm", :id, "--memory", "4048"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
      vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
      vb.customize ["modifyvm", :id, "--nic2", "bridged", "--bridgeadapter2", "eth0"]
      vb.customize ["modifyvm", :id, "--nic3", "hostonly", "--hostonlyadapter3", "vboxnet0"]

      if not File.exist?('drives/gluster_brick3.vdi')
        vb.customize ["createhd", "--filename", "drives/gluster_brick3.vdi", "--size", "512000"]
        vb.customize ["storagectl", :id, "--name", "SATA Controller", "--add", "sata", "--controller", "IntelAHCI"]
        vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "0", "--device", "0", "--type", "hdd", "--medium", "drives/gluster_brick3.vdi"]
      end
    end

    compute2.vm.provision "shell", path: "config/compute2.interfaces.sh"
    compute2.vm.provision "shell", path: "scripts/networking.sh"
    compute2.vm.provision "shell", path: "config/hosts.sh"
    compute2.vm.provision "shell", path: "config/ntp.conf.sh"
    compute2.vm.provision "shell", path: "scripts/openstack-prep.sh"
    compute2.vm.provision "shell", path: "scripts/glusterfs-prep.sh"
    compute2.vm.provision "shell", path: "scripts/glusterfs-volumes.sh"  # this needs to run on last compute node
    compute2.vm.provision "shell", path: "scripts/dbus.sh"
    compute2.vm.provision "shell", path: "scripts/mysql-client.sh"
    compute2.vm.provision "shell", path: "scripts/compute-prep.sh"
    compute2.vm.provision "shell", path: "config/compute2.nova.conf.sh"
    compute2.vm.provision "shell", path: "config/nova-compute.conf.sh"
    compute2.vm.provision "shell", path: "config/compute-api-paste.ini.sh"
    compute2.vm.provision "shell", path: "scripts/compute-configuration.sh"
    compute2.vm.provision "shell", path: "scripts/compute.nova-network.sh"
  end
end

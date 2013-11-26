# Vagrant OpenStack (Havana)  

These scripts will fire up an [OpenStack](http://www.openstack.org/software) private cloud consisting of a controller and two compute nodes (compute1 and compute2).  Each machine will get an extra 500GB hdd that will be used with [glusterfs](http://www.gluster.org/) to setup replication volumes.  The [OpenStack guide for Havana on Ubuntu](http://docs.openstack.org/havana/install-guide/install/apt/content/) was used as a base guide, with the changes made to accomodate Ubuntu 13.10, qemu and glusterfs.  

Because this is built in VirtualBox the compute nodes are setup to use [qemu](http://wiki.qemu.org/Main_Page), but on bare metal hardware OpenStack [supports](https://wiki.openstack.org/wiki/HypervisorSupportMatrix) a variety of [hypervisors](http://docs.openstack.org/havana/config-reference/content/section_compute-hypervisors.html).  

## Pre-requisites  

* [Vagrant](http://www.vagrantup.com/)  
* [VirtualBox](https://www.virtualbox.org/) w/ a host only network named vboxnet0  
* [Ubuntu 13.10 amd64 vagrant base box](docs/packer.md)  

## Build OpenStack using vagrant   

### Quick start  

For the brave, this will fire up all the servers and do everything.  This process "takes a while" an produces a lot of valuable troubleshooting output, so capture it with _tee_.  

	vagrant up | tee vagrant.log  

### One at a time please  

The first time you fire up your OpenStack it would be a good idea to do them one at a time and save the output.  

        vagrant up controller | tee controller.log  
        vagrant up compute1 | tee compute1.log  
        vagrant up compute2 | tee compute2.log  

*When compute2 is brought up, the glusterfs volumes will be setup and available/replicated on all three servers.*  

### Post-configuration and testing  

After the [3 servers](docs/servers.md) are running and provisioned you can do the [post-configuration and testing](docs/post-configuration.md) of your OpenStack to verify everything was installed correctly.  

## Copyright  

This project is copyrighted under a [MIT license](LICENSE) and you are free to make changes and/or improvements to fit your needs and pretty much use this software in any way you like. Feel free to add issues for improvements or even better a pull request.  You can also talk to us on [Freenode IRC](https://webchat.freenode.net/) in the #socialgeeks channel.  


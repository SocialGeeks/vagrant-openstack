# Setting up Packer base box for vagrant  

## Build base box with Packer and the packer-builders repository  

You can download the [packer-boxes](https://github.com/SocialGeeks/packer-boxes) repository and [follow the README.md](https://github.com/SocialGeeks/packer-boxes/blob/master/README.md) to create vagrant base boxes and add them to your library.  Note: once the base box has been created and imported into vagrant there is no reason to recreate it everytime.   

	git clone https://github.com/SocialGeeks/packer-boxes
	cd packer-boxes/ubuntu-13.10-amd64  
	packer build template.json  
	vagrant box remove ubuntu-13.10-amd64 virtualbox  # this step is only needed if you have an old version  
	vagrant box add ubuntu-13.10-amd64 packer_virtualbox_virtualbox.box  
	rm packer_virtualbox_virtualbox.box  

The base box is now available to use with vagrant.  

	vagrant box list  


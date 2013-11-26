#  Post configuration and testing   

To test out your cloud login to the controller *vagrant ssh controller* and run the following commands.  

        sudo -s  
        source /root/keystonerc  
        nova network-create vmnet --fixed-range-v4=192.168.42.0/24 --bridge-interface=br100 --multi-host=T  
        nova network-list  
	ip route add 192.168.42.0/24 via 192.168.56.11  
        mount -t glusterfs localhost:/glance-images /glance-images   
        chown glance:glance /glance-images  
        wget http://cdn.download.cirros-cloud.net/0.3.1/cirros-0.3.1-x86_64-disk.img  
        glance image-create --name="CirrOS 0.3.1" --disk-format=qcow2 --container-format=bare --is-public=true < cirros-0.3.1-x86_64-disk.img  
        rm cirros-0.3.1-x86_64-disk.img  
        nova image-list  
        nova flavor-list  
        nova boot --flavor 1 --key_name mykey --image _image-id_ --security_group default cirrOS  
        nova list  
        nova show cirrOS  

Wait for the new instance to reach active status.

        ssh cirros@192.168.42.2  

Password is:  cubswin:)  

***Note:*** It may take a while after the machine is active for SSH to be setup the first time.  Trying pinging the machine and then waiting another minute or so for the SSH service to become available.  


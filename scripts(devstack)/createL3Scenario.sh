#!/bin/bash

source openrc admin admin

TENANT_ID=$(keystone tenant-list 2> /dev/null | grep '\s'admin'' | awk '{print $2}')
IMAGE_ID=$(nova image-list | grep 'cirros-0.3.4-x86_64-uec\s' | awk '{print $2}')

neutron net-create net1 --tenant-id $TENANT_ID --provider:network_type gre --provider:segmentation_id 101
neutron subnet-create --name subnet1 --tenant-id $TENANT_ID net1 10.101.0.0/24 --gateway=10.101.0.1 --dns-nameserver 8.8.8.8
NET1_ID=$(neutron net-list | grep -w net1 | awk '{print $2}')

neutron net-create net2 --tenant-id $TENANT_ID --provider:network_type gre --provider:segmentation_id 102
neutron subnet-create --name subnet2 --tenant-id $TENANT_ID net2 10.102.0.0/24 --gateway=10.102.0.1 --dns-nameserver 8.8.8.8
NET2_ID=$(neutron net-list | grep -w net2 | awk '{print $2}') 

neutron router-create R1 --tenant-id $TENANT_ID
neutron router-interface-add R1 subnet1
neutron router-interface-add R1 subnet2

nova boot VM1-NET1 --poll --flavor m1.nano --image $IMAGE_ID --nic net-id=${NET1_ID} --availability-zone nova:ctrl-comp1
nova boot VM2-NET1 --poll --flavor m1.nano --image $IMAGE_ID --nic net-id=${NET1_ID} --availability-zone nova:comp2
nova boot VM1-NET2 --poll --flavor m1.nano --image $IMAGE_ID --nic net-id=${NET2_ID} --availability-zone nova:ctrl-comp1
nova boot VM2-NET2 --poll --flavor m1.nano --image $IMAGE_ID --nic net-id=${NET2_ID} --availability-zone nova:comp2

#!/bin/bash

cd /home/vnx/devstack

source openrc admin admin

TENANT_ID=$(keystone tenant-list 2> /dev/null | grep '\s'admin'' | awk '{print $2}')
IMAGE_ID=$(nova image-list | grep 'cirros-0.3.4-x86_64-uec\s' | awk '{print $2}')

neutron net-create NET1 --tenant-id $TENANT_ID --provider:network_type gre --provider:segmentation_id 101
neutron subnet-create --name SUBNET1 --tenant-id $TENANT_ID NET1 10.101.0.0/24 --gateway=10.101.0.1 --dns-nameserver 8.8.8.8
NET1_ID=$(neutron net-list | grep -w NET1 | awk '{print $2}')

neutron net-create NET2 --tenant-id $TENANT_ID --provider:network_type gre --provider:segmentation_id 102
neutron subnet-create --name SUBNET2 --tenant-id $TENANT_ID NET2 10.102.0.0/24 --gateway=10.102.0.1 --dns-nameserver 8.8.8.8
NET2_ID=$(neutron net-list | grep -w NET2 | awk '{print $2}') 

neutron router-create R1 --tenant-id $TENANT_ID
neutron router-interface-add R1 SUBNET1
neutron router-interface-add R1 SUBNET2

nova boot VM-11 --poll --flavor m1.tiny --image $IMAGE_ID --nic net-id=${NET1_ID} --availability-zone nova:ctrl-comp1
nova boot VM-12 --poll --flavor m1.tiny --image $IMAGE_ID --nic net-id=${NET1_ID} --availability-zone nova:ctrl-comp1
nova boot VM-22 --poll --flavor m1.tiny --image $IMAGE_ID --nic net-id=${NET2_ID} --availability-zone nova:ctrl-comp1
nova boot VM-22 --poll --flavor m1.tiny --image $IMAGE_ID --nic net-id=${NET2_ID} --availability-zone nova:ctrl-comp1

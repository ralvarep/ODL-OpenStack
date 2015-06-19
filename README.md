# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore an OpenStack environment in which the network management is provided for OpenDaylight.

Demo scenarios have been created using [Virtual Networks over linuX (VNX)](http://www.dit.upm.es/~vnx/).


## Requirements

 - VNX installed [VNX Installation Guide](http://web.dit.upm.es/vnxwiki/index.php/Vnx-install)
 - KVM-based Nested Virtualization
 - Free disk space: 5 GB (root filesystem size)

Those scenarios have been tested in a laptop with:
- Intel® Core™ i7-4710HQ CPU @ 2.50GHz × 8
- 16 GB RAM
- Ubuntu 15.04

## Usage

**STEP 1: Clone this repository**
~~~
$ git clone https://github.com/ralvarep/odl-openstack.git
~~~

**STEP 2: Build root filesystem** (Read filesystems/00-README.txt)
~~~
$ filesystems/download-rootfs.sh
~~~

**STEP 3: Create virtual scenario**

There are several scenarios in which you can interact. To create them:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -t

 SCENARIO_FILE ===> single-node_with_externalODL
               ===> single-node_with_internalODL
               ===> multi-node_2nodes
               ===> multi-node_3nodes
               ===> multi-node_4nodes
~~~

**STEP 4: Start virtual scenario**

The virtual scenarios can be started with different configurations. When the scenario is created, run:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x CONF_ID

 CONF_ID ===> start-neutron (Only start Neutron, without OpenDaylight)
         ===> start-odl-l2  (Start Neutron with OpenDaylight. L2 services enabled)
         ===> start-odl-l3  (Start Neutron with OpenDaylight. L2 & L3 services enabled)
         ===> stop          (Stop DevStack and OpenDaylight)
~~~

## Scenarios

##### Single-node_with_externalODL
~~~
=> ctrl-comp1 (Controller node [Controller + Network + Compute])
~~~

##### Single-node_with_internallODL
~~~
=> ctrl-comp1 (OpenDaylight & Controller node [Controller + Network + Compute])
~~~

##### Multi-node_2nodes
~~~
=> odl......... (OpenDaylight node)
=> ctrl-comp1.. (Controller node [Controller + Network + Compute])
~~~

##### Multi-node_3nodes
~~~
=> odl......... (OpenDaylight node)
=> ctrl-comp1.. (Controller node [Controller + Network + Compute1])
=> comp2....... (Controller node [Compute2])
~~~
![Multi-node_3nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_3nodes.jpg)

##### Multi-node_4nodes
~~~
=> odl......... (OpenDaylight node)
=> ctrl-comp1.. (Controller node [Controller + Network + Compute1])
=> comp2....... (Controller node [Compute2])
=> comp3....... (Controller node [Compute3])
~~~


## Author

This project has been developed by [Raúl Álvarez Pinilla](http://github.com/ralvarep) as a result of the Master's Thesis entitled *Study of Software Defined Networking through the development of virtual scenarios based on the OpenDaylight controller*.


## References


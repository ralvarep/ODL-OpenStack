# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore an OpenStack environment in which the network management is provided for OpenDaylight.

Demo scenarios have been created using [Virtual Networks over linuX (VNX)](http://www.dit.upm.es/~vnx/).

## Requirements

 - VNX installed http://web.dit.upm.es/vnxwiki/index.php/Vnx-install

## Usage

**STEP 1: Clone this repository**
~~~
$ git clone https://github.com/ralvarep/odl-openstack.git
~~~

**STEP 2: Build root filesystem ** (Read filesystems/00-README.txt)
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

#### Single-node_with_externalODL

##### * Single-node_with_internallODL


###### Multi-node_2nodes


* Multi-node_3nodes
![Multi-node_3nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_3nodes.jpg)
* Multi-node_4nodes


## Author

This project has been developed by [Raúl Álvarez Pinilla](http://github.com/ralvarep) as a result of the Master's Thesis entitled *Study of Software Defined Networking through the development of virtual scenarios base on the OpenDaylight controller*.


## References


# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore an OpenStack environment in which OpenDaylight is the network management provider.

Demo scenarios have been created using [Virtual Networks over linuX (VNX)](http://www.dit.upm.es/~vnx/).


## Requirements

 - VNX installed [(VNX Installation Guide)](http://web.dit.upm.es/vnxwiki/index.php/Vnx-install)
 - KVM-based nested virtualization
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

 SCENARIO_FILE => single-node_with_externalODL
               => single-node_with_internalODL
               => multi-node_2nodes
               => multi-node_3nodes
               => multi-node_4nodes
~~~

**STEP 4: Start virtual scenario**

The virtual scenarios can be started with different configurations. For this, it is automatically loaded the appropriate configuration in DevStack nodes.

When the scenario is created, run:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x CONF_TAG

 CONF_TAG => start-no-odl  (Start DevStack, without OpenDaylight)
          => start-odl-l2  (Start DevStack with OpenDaylight. L2 services enabled)
          => start-odl-l3  (Start DevStack with OpenDaylight. L2 & L3 services enabled)
~~~
This step takes several minutes, about 5-10 min (depending on the chosen configuration and host computing capacity).

**OTHER OPTIONS**

* Stop DevStack and OpenDaylight
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x stop
~~~
* Shutdown scenario
~~~
$ sudo vnx -f SCENARIO_FILE.xml --shutdown
~~~
* Start scenario that has previously been shutdown
~~~
$ sudo vnx -f SCENARIO_FILE.xml --start
~~~
* Destroy scenario
~~~
$ sudo vnx -f SCENARIO_FILE.xml -P
~~~
* Other useful tags to be executed
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x TAG

 TAG => stack     (Execute stack.sh)
     => unstack   (Execute unstack.sh)
     => start-odl (Start OpenDaylight)
     => stop-odl  (Stop OpenDaylight)
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
=> comp2....... (Compute node [Compute2])
~~~
![Multi-node_3nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_3nodes.jpg)

##### Multi-node_4nodes
~~~
=> odl......... (OpenDaylight node)
=> ctrl-comp1.. (Controller node [Controller + Network + Compute1])
=> comp2....... (Compute node [Compute2])
=> comp3....... (Compute node [Compute3])
~~~

## Notes

* virbr0
* 8 cpu 16 RAM


## Author

This project has been developed by [Raúl Álvarez Pinilla](http://github.com/ralvarep) as a result of the Master's Thesis entitled *Study of Software Defined Networking through the development of virtual scenarios based on the OpenDaylight controller*.


## References


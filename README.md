# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore an OpenStack environment in which OpenDaylight is the network management provider.

Demo scenarios have been created using [Virtual Networks over linuX (VNX)](http://www.dit.upm.es/~vnx/).


## Requirements

 - VNX installed [(VNX Installation Guide)](http://web.dit.upm.es/vnxwiki/index.php/Vnx-install)
 - KVM-based nested virtualization
 - Free disk space: 5 GB (root filesystem size)
 - 4GB or more of RAM.

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

There are [several scenarios](https://github.com/ralvarep/odl-openstack#scenarios) in which you can interact. To create them:
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
          => start-odl-l2  (Start DevStack with OpenDaylight [L2 services])
          => start-odl-l3  (Start DevStack with OpenDaylight [L2 & L3 services])
~~~
This step takes several minutes, about 5-10 min (depending on the chosen configuration and host computing capacity).

**OTHER OPTIONS:**

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

* The XML templates of virtual scenarios *(SCENARIO_FILE.xml)* have been configured for a host with 8 VCPU and 16 GB RAM. If you have less memory and computing resources, these values can be changed in the definitions of virtual machines.

* In these scenarios it has been used [virbr0 network](http://wiki.libvirt.org/page/VirtualNetworking), which is provided by default by libvirt. If you are using other libvirt network, change *192.168.122.X* for you network IP in SCENARIO_FILE.xml files and local.conf located under *conf* folder.


## Author

This project has been developed by [Raúl Álvarez Pinilla](http://github.com/ralvarep) as a result of the Master's Thesis entitled *Study of Software Defined Networking through the development of virtual scenarios based on the OpenDaylight controller*.


## References


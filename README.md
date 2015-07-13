# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore an OpenStack environment in which OpenDaylight is the network management provider.

Demo scenarios have been created using [Virtual Networks over linuX (VNX)](http://www.dit.upm.es/~vnx/).

Index:
- [Requirements](https://github.com/ralvarep/odl-openstack#requirements)
- [Usage](https://github.com/ralvarep/odl-openstack#usage)
- [Scenarios](https://github.com/ralvarep/odl-openstack#scenarios)
- [Example topologies in OpenStack](https://github.com/ralvarep/odl-openstack#example-topologies-in-openstack)
- [Notes](https://github.com/ralvarep/odl-openstack#notes)
- [Author](https://github.com/ralvarep/odl-openstack#author)
- [References](https://github.com/ralvarep/odl-openstack#references)

![OpenDaylight & OpenStack](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/odl-openstack.jpg)


## Requirements

 - VNX installed [(VNX Installation Guide)](http://web.dit.upm.es/vnxwiki/index.php/Vnx-install)
 - KVM-based nested virtualization
 - Hard Drive: 5 GB avaible space (Filesystem size)
 - Memory: 4 GB RAM or more

## Usage

**STEP 1: Clone this repository**
~~~
$ git clone https://github.com/ralvarep/odl-openstack.git
~~~

**STEP 2: Build filesystem** (Read filesystems/00-README.txt)

Virtual scenarios have been configured using filesystems in [copy-on-write (COW) mode](https://en.wikipedia.org/wiki/Copy-on-write). This allows you to use a single filesystem for all virtual machines, thereby optimizing the disk space occupied.
~~~
$ filesystems/download-rootfs.sh
~~~

**STEP 3: Create virtual scenario**

There are [several scenarios](https://github.com/ralvarep/odl-openstack#scenarios) in which you can interact. To create them:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -t

 SCENARIO_FILE => single-node
               => multi-node_2nodes
               => multi-node_3nodes
               => multi-node_4nodes
~~~

**STEP 4: Start virtual scenario**

The virtual scenarios can be started with different configurations. For this, it is automatically loaded the appropriate configuration in DevStack nodes.

When the scenario is created, login to consoles with vnx:xxxx, and then run in the host:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x CONF_TAG --h2vm-timeout 0

 CONF_TAG => start-no-odl  (Start DevStack, without OpenDaylight)
          => start-odl-l2  (Start DevStack with OpenDaylight [L2 services])
          => start-odl-l3  (Start DevStack with OpenDaylight [L2 & L3 services])
~~~
This step takes several minutes, about 5-10 min (depending on the chosen configuration and host computing capacity).

Finally, the following message will be showed...
~~~
This is your host ip: 10.0.0.11
Horizon is now available at http://10.0.0.11/
Keystone is serving at http://10.0.0.11:5000/
The default users are: admin and demo
The password: password
~~~
...and you can test OpenDaylight and OpenStack ☺. 

Horizon is avaible from host through [192.168.122.11](https://192.168.122.11).

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
* To resize consoles, execute in each VM:
~~~
$ resize
~~~


## Scenarios

##### Single-node (with external OpenDaylight)
~~~
=> ctrl-comp1 (Controller node [Controller + Network + Compute])
~~~
![Single-node](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/single-node.jpg)

##### Multi-node_2nodes
~~~
=> odl......... (OpenDaylight node)
=> ctrl-comp1.. (Controller node [Controller + Network + Compute])
~~~
![Multi-node_2nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_2nodes.jpg)

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
![Multi-node_4nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_4nodes.jpg)


## Example topologies in OpenStack

##### L2
![L2](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/openstack-l2.jpg)

##### L3
![L3](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/openstack-l3.jpg)


## Notes

* The XML templates of virtual scenarios *(SCENARIO_FILE.xml)* have been configured for a host with 8 VCPU and 16 GB RAM. If you have less memory and computing resources, these values can be changed in the definitions of virtual machines.

* It has been used [virbr0 network](http://wiki.libvirt.org/page/VirtualNetworking) in these scenarios, which is provided by default by libvirt. If you are using other libvirt network, change *192.168.122.X* for you network IP in *SCENARIO_FILE.xml* files and *local.conf* located under *conf* folder.


## Author

This project has been developed by [Raúl Álvarez Pinilla](https://es.linkedin.com/in/raulalvarezpinilla) as a result of the Master's Thesis entitled *"Study of Software Defined Networking through the development of virtual scenarios based on the OpenDaylight controller"* in [Telematics Engineering Department (DIT)](http://www.dit.upm.es) of the [Technical University of Madrid (UPM)](http://www.upm.es/).


## References


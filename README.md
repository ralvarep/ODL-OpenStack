# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore the OpenDaylight Integration with OpenStack.

This demo scenarios have been created using Virtual Networks over linuX (VNX).

## Requirements

 - VNX installed [http://web.dit.upm.es/vnxwiki/index.php/Vnx-install]

## Usage
**STEP 1: Clone this repository**
~~~
$ git clone https://github.com/ralvarep/odl-openstack.git
~~~
**STEP 2: Build root filesystem (2 options)**
~~~
$ cat filesystems/00-README.txt
~~~
**STEP 3: Create virtual scenario**
~~~
$ sudo vnx -f SCENARIO_FILE.xml -t

SCENARIO_FILE.xml   ===> single-node_with_externalODL.xml
                    ===> single-node_with_internalODL.xml
                    ===> multi-node_2nodes.xml
                    ===> multi-node_3nodes.xml
                    ===> multi-node_4nodes.xml
                    
~~~
**STEP 4: Start virtual scenario**

The virual scenarios can be started with different configurations:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x CONF_ID
~~~

## Scenarios

### *Multi-node_3nodes
![Multi-node_3nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_3nodes.jpg)


## References

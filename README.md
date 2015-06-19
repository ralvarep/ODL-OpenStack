# OpenDaylight Integration with OpenStack
This repository provides a set of virtual scenarios to explore the OpenDaylight Integration with OpenStack.

Demo scenarios have been created using Virtual Networks over linuX (VNX).

## Requirements

 - VNX installed http://web.dit.upm.es/vnxwiki/index.php/Vnx-install

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

There are several scenarios in which you can interact. To create them:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -t

SCENARIO_FILE.xml ===> single-node_with_externalODL
                  ===> single-node_with_internalODL
                  ===> multi-node_2nodes
                  ===> multi-node_3nodes
                  ===> multi-node_4nodes
~~~
**STEP 4: Start virtual scenario**

The virtual scenarios can be started with different configurations. When the scenario is created, run:
~~~
$ sudo vnx -f SCENARIO_FILE.xml -x CONF_ID

CONF_ID ===> start-neutron
        ===> start-odl-l2
        ===> start-odl-l3
        ===> stop
~~~

## Scenarios

### * Multi-node_3nodes
![Multi-node_3nodes](https://raw.githubusercontent.com/ralvarep/odl-openstack/master/network_maps/multi-node_3nodes.jpg)


## References

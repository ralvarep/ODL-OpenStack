~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~ ROOT FILESYSTEMS ~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two options for building the necessary root filesystem to start the virtual scenarios:


A) DOWNLOAD ROOTFS (with everything necessary)

	wget ...


B) CREATE ROOTFS MANUALLY

	B.1) Download KVM Ubuntu 14.04 VNX rootfs (64 bits)

		vnx_download_rootfs vnx_rootfs_kvm_ubuntu64-14.04-v025.qcow2.bz2

	B.2) Modify the rootfs

		vnx --modify-rootfs vnx_rootfs_kvm_ubuntu64-14.04-v025.qcow2 --mem 4G --vcpu 8 --arch x86_64

	B.3) Install OpenDaylight (Karaf 0.2.4)

		apt-get install maven openjdk-7-jre openjdk-7-jdk unzip wget
		wget https://nexus.opendaylight.org/content/repositories/opendaylight.snapshot/org/opendaylight/integration/distribution-karaf/0.2.4-SNAPSHOT/distribution-karaf-0.2.4-20150530.024323-26.zip
		unzip distribution-karaf-*.zip
		bin/karaf
		feature:install odl-base-all odl-aaa-authn odl-restconf odl-nsf-all odl-adsal-northbound odl-mdsal-apidocs odl-ovsdb-openstack odl-ovsdb-northbound odl-dlux-core

	B.4) Install Open vSwitch 2.3.1

		apt-get install autoconf automake build-essential debhelper dkms fakeroot graphviz ipsec-tools iputils-arping iputils-ping libssl-dev libtool module-assistant python-all python-qt4 python-twisted-conch python-twisted-web racoon
		wget http://openvswitch.org/releases/openvswitch-2.3.1.tar.gz
		tar xvf openvswitch-2.3.1.tar.gz 
		DEB_BUILD_OPTIONS='nocheck' fakeroot debian/rules binary
		sudo dpkg -i ../*.deb

	B.5) Install DevStack

		apt-get install git
		git clone -b stable/kilo https://git.openstack.org/openstack-dev/devstack
		[You can run DevStack to install and download the required dependencies]

	B.X) Install others useful packages [optional]
		
		apt-get install xterm nano wireshark tcpdump curl htop


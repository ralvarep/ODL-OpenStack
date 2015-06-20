#!/bin/bash

# Rootfs
ROOTFSNAME=devstack_odl_ovs_KILO.qcow2

# Move to the directory where the script is located
CDIR=`dirname $0`
cd $CDIR

# Download rootfs
echo "-----------------------------------------------------------------------"
echo "Downloading rootfs..."
vnx_download_rootfs -r ${ROOTFSNAME}.bz2

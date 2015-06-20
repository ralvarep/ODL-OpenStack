#!/bin/bash

ROOTFSNAME=devstack_odl_ovs_KILO.qcow2

# Download base rootfs
echo "-----------------------------------------------------------------------"
echo "Downloading rootfs..."
vnx_download_rootfs -r ${ROOTFSNAME}.bz2

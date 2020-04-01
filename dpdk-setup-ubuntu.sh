#!/bin/sh


if [ $1 == "setup" ]; then
	wget https://dpdk.org/rel/dpdk-17.11.2.tar.xz
	xz -d dpdk-17.11.2.tar.xz
	tar -xvf dpdk-17.11.2.tar

	export RTE_SDK=dpdk-stable-17.11.2
	export RTE_TARGET=x86_64-native-linuxapp-gcc

	sed -i 's/CONFIG_RTE_EAL_NUMA_AWARE_HUGEPAGES=y/CONFIG_RTE_EAL_NUMA_AWARE_HUGEPAGES=n/' dpdk-stable-17.11.2/config/common_linuxapp
	sed -i 's/CONFIG_RTE_LIBRTE_VHOST_NUMA=y/CONFIG_RTE_LIBRTE_VHOST_NUMA=n/' dpdk-stable-17.11.2/config/common_linuxapp
	sed -i 's/CONFIG_RTE_KNI_KMOD=y/CONFIG_RTE_KNI_KMOD=n/' dpdk-stable-17.11.2/config/common_linuxapp

	sed -i 's/(pci_intx_mask_supported(udev->pdev))/(pci_intx_mask_supported(udev->pdev) || 1)/' dpdk-stable-17.11.2/lib/librte_eal/linuxapp/igb_uio/igb_uio.c

	cd dpdk-stable-17.11.2/usertools
	./dpdk-setup.sh

elif [ $1 == "load" ]; then

	modprobe uio
	insmod dpdk-stable-17.11.2/x86_64-native-linuxapp-gcc/kmod/igb_uio.ko
       
elif [ $1 == "binding" ]; then
 
        ifconfig $2 down
 	dpdk-stable-17.11.2/usertools/dpdk-devbind.py -b igb_uio $2
	dpdk-stable-17.11.2/usertools/dpdk-devbind.py --status

elif [ $1 == "release" ]; then

  	dpdk-stable-17.11.2/usertools/dpdk-devbind.py -b e1000 $2
	ifconfig $2 up

elif [ $1 == "quick" ]; then
        git clone https://github.com/phdgang/storage.git
        apt-get install -y pciutils

else

	echo "wrong flag"

fi


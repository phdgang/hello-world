#!/bin/sh
#https://fd.io/docs/vpp/master/gettingstarted/installing/ubuntu.html

touch /etc/apt/sources.list.d/99fd.io.list

if [ $1='install' -o -z "$1" ]; then
	echo "deb [trusted=yes] https://packagecloud.io/fdio/master/ubuntu bionic main" > /etc/apt/sources.list.d/99fd.io.list
	curl -L https://packagecloud.io/fdio/master/gpgkey | sudo apt-key add -
	apt-get update
	apt-get install vpp vpp-plugin-core vpp-plugin-dpdk
elif [ $1='remove' ]
	apt-get remove --purge vpp*
fi


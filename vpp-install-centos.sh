#!/bin/sh
#https://fd.io/docs/vpp/master/gettingstarted/installing/centos.html

yum install pygpgme yum-utils

touch /etc/yum.repos.d/fdio-release.repo

cat > /etc/yum.repos.d/fdio-release.repo <<EOF
[fdio_master]
name=fdio_master
baseurl=https://packagecloud.io/fdio/master/el/7/$basearch
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/fdio/master/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300

[fdio_master-source]
name=fdio_master-source
baseurl=https://packagecloud.io/fdio/master/el/7/SRPMS
repo_gpgcheck=1
gpgcheck=0
enabled=1
gpgkey=https://packagecloud.io/fdio/master/gpgkey
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
metadata_expire=300
EOF


yum update

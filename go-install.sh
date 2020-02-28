#!/bin/sh

wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
dir=`pwd`
tar -C ${dir} -xzf go1.14.linux-amd64.tar.gz
echo "export GOROOT=${dir}/go" >> /etc/profile
echo "export PATH=$PATH:$GOROOT/bin:$GOBIN" >> /etc/profile
source /etc/profile


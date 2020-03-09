#!/bin/sh

wget https://dl.google.com/go/go1.14.linux-amd64.tar.gz
dir=`pwd`
GOROOT=/usr/local/go
tar -C /usr/local -xzf go1.14.linux-amd64.tar.gz
echo "export GOROOT=/usr/local/go" >> /etc/profile
echo "export PATH=$PATH:${GOROOT}/bin:$GOBIN" >> /etc/profile
echo "export GOPROXY=https://goproxy.cn" >> /etc/profile
echo "export GOPATH=${dir}"
rm -f go1.14.linux-amd64.tar.gz
source /etc/profile


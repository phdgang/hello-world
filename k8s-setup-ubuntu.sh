#!/bin/sh

apt-get update && apt-get install -y apt-transport-https
echo "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update --allow-insecure-repositories
apt-get install -y kubelet kubeadm kubectl --allow-unauthenticated

for i in `kubeadm config images list`; do
    imageName=${i#k8s.gcr.io/}
    docker pull registry.aliyuncs.com/google_containers/$imageName
    docker tag registry.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    docker rmi registry.aliyuncs.com/google_containers/$imageName
done;

swapoff -a

ipAddr=`ifconfig eth1 | awk 'NR==2 {print $2}'`

kubeadm init --apiserver-advertise-address ${ipAddr} --pod-network-cidr=192.168.0.0/16

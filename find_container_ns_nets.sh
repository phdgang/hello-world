#!/bin/bash

container_ids=`docker ps | awk 'NR > 1 {print $1}'`
for container_id in ${container_ids}
do 
 pid=$(sudo docker inspect -f '{{.State.Pid}}' ${container_id})
 ln -sfT /proc/$pid/ns/net /var/run/netns/${container_id}
done

ip netns ls

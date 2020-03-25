#!/bin/bash

ovn_version=2.11.4-2

rpm -ivh --nodeps https://github.com/alauda/ovs/releases/download/${ovn_version}/ovn-${ovn_version}.el7.x86_64.rpm
rpm -ivh --nodeps https://github.com/alauda/ovs/releases/download/${ovn_version}/ovn-common-${ovn_version}.el7.x86_64.rpm
rpm -ivh --nodeps https://github.com/alauda/ovs/releases/download/${ovn_version}/ovn-central-${ovn_version}.el7.x86_64.rpm
rpm -ivh --nodeps https://github.com/alauda/ovs/releases/download/${ovn_version}/ovn-host-${ovn_version}.el7.x86_64.rpm
rpm -ivh --nodeps https://github.com/alauda/ovs/releases/download/${ovn_version}/ovn-vtep-${ovn_version}.el7.x86_64.rpm




#!/bin/bash

##### for centOS 7 initial  #####
pkill docker 
sleep 3
yum -y remove firewalld  >/dev/null 2>&1
echo "firewalld remove success"
yum -y install iptables-service > /dev/null 2>&1
echo "iptables install success"
yum install  bridge-utils > /dev/null 2>&1
echo "echo bridge-utils install success"
iptables -t nat -F
ifconfig docker0 down
brctl delbr docker0
echo "docker restart success !!!"

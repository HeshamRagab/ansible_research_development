#!/bin/bash

cd /etc/self-cert
getip=$(ip addr show ${1} | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
./gen_self_cert.sh ${getip}
chown etcd:etcd /etc/self-cert/c*
chmod u+rwx /etc/self-cert/c*
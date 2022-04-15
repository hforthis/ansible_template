#!/bin/bash
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

sleep 2

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sleep 2

sudo /bin/sh -c 'echo "1" > /proc/sys/net/ipv4/ip_forward'

exit 0

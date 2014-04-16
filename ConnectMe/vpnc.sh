#! /bin/bash
sudo ipfw add 7000 allow tcp from any to any dst-port 6333
sudo /usr/local/sbin/vpnc /etc/vpnc/default.conf --local-port 6333

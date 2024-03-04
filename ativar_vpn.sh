#!/bin/bash
dhclient ens4
ping 10.0.0.7 -c 1

ip route add 10.1.0.0/16 via 10.0.0.20
ip route add 10.90.0.0/15 via 10.0.0.20
ping 10.1.254.198 -c 1


# bash <(curl -s https://raw.githubusercontent.com/wzuqui/wzuqui/main/ativar_vpn.sh)

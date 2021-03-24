#!/bin/bash

nmcli connection add type team con-name myteam ifname myteam config '{"runner":       {"name": "activebackup"}}'
nmcli connection add type team-slave con-name port1 ifname ens39 master myteam
nmcli connection add type team-slave con-name port2 ifname ens40 master myteam
nmcli connection show
nmcli connection modify myteam ipv4.addresses "192.168.10.100/24"
nmcli connection modify myteam ipv4.method static
nmcli connection down myteam; nmcli connection up myteam
nmcli connection down port1; nmcli connection up port1
nmcli connection down port2; nmcli connection up port2
nmcli connection down port1
teamdctl myteam state
nmcli connection up port1
teamdctl myteam state
ip a
ping 192.168.10.100


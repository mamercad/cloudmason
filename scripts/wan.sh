#!/usr/bin/env bash
for iface in eth0 eth1 eth2; do
  ipaddr=$(/opt/vyatta/bin/vyatta-show-interfaces | grep "global $iface" | awk '{print $2}' | sed 's/\/.*$//')
  echo "'$iface' '$ipaddr'"
done

#!/usr/bin/env bash

echo "Figuring out WAN addresses"
eth2="$(../scripts/wan/eth2)"; export eth2
eth0="$(../scripts/wan/eth0)"; export eth0

if [[ -z "$eth2" ]] || [[ -z "$eth0" ]]; then
  echo "$0 Either eth2 or eth0 is empty, bailing!"
  exit 1
else
  echo "eth2: $eth2"
  echo "eth0: $eth0"
fi

echo "Templating external configs"
../scripts/mo config/external/cloudmason.org.yaml.mo | tee config/external/cloudmason.org.yaml
../scripts/mo config/external/letsbuildthe.cloud.yaml.mo | tee config/external/letsbuildthe.cloud.yaml

if ! command -v octodns-sync &>/dev/null; then
  echo "$0: Can't find octodns-sync, bailing!"
  exit 1
fi

if [[ "$1" == "--doit" ]]; then
  echo "Syncing OctoDNS"
  octodns-sync --config-file config/external.yaml --doit
  octodns-sync --config-file config/internal.yaml --doit
else
  echo "Showing OctoDNS"
  octodns-sync --config-file config/external.yaml
  octodns-sync --config-file config/internal.yaml
fi

if [[ "$1" == "--doit" ]]; then
  echo "Restarting PowerDNS"
  ssh mark@192.168.1.10 "sudo systemctl restart pdns; sudo systemctl restart pdns-recursor"; sleep 3
  ssh mark@192.168.1.11 "sudo systemctl restart pdns; sudo systemctl restart pdns-recursor"; sleep 3
  ssh mark@192.168.1.67 "sudo systemctl restart pdns; sudo systemctl restart pdns-recursor"; sleep 3
fi

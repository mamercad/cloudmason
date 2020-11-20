#!/usr/bin/env bash

export eth2="$(../scripts/wan/eth2)"
export eth0="$(../scripts/wan/eth0)"

if [[ -z "$eth2" ]] || [[ -z "$eth0" ]]; then
  echo "Either eth2 or eth0 is empty, bailing!"
  exit 1
fi

../scripts/mo config/external/cloudmason.org.yaml.mo | tee config/external/cloudmason.org.yaml
../scripts/mo config/external/letsbuildthe.cloud.yaml.mo | tee config/external/letsbuildthe.cloud.yaml

octodns-sync --config-file config/external.yaml $*
octodns-sync --config-file config/internal.yaml $*

echo -n "Restart PowerDNS? "
read ans
ssh -v powerdns1 "sudo systemctl restart pdns; sudo systemctl restart pdns-recursor"
sleep 2
ssh -v powerdns2 "sudo systemctl restart pdns; sudo systemctl restart pdns-recursor"

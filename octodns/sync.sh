#!/usr/bin/env bash
eth2="$(../scripts/wan/eth2)" ../scripts/mo config/external/letsbuildthe.cloud.yaml.mo | tee config/external/letsbuildthe.cloud.yaml
octodns-sync --config-file config/production.yaml $*

---
'':
  - type: A
    value: {{eth0}}
    ttl: 3600
  - type: MX
    values:
      - exchange: mx1.forwardemail.net.
        preference: 10
      - exchange: mx2.forwardemail.net.
        preference: 20
    ttl: 3600
  - type: TXT
    values:
      - forward-email=mamercad@gmail.com
      - v=spf1 a mx include:spf.forwardemail.net include:_spf.google.com -all
    ttl: 3600
att:
  type: A
  value: {{eth2}}
  ttl: 3600
xfinity:
  type: A
  value: {{eth0}}
  ttl: 3600
smtp:
  type: A
  value: {{eth0}}
  ttl: 3600
awx:
  type: A
  value: {{eth0}}
  ttl: 3600
awx-dev:
  type: A
  value: {{eth0}}
  ttl: 3600
opennebula:
  type: A
  value: {{eth0}}
  ttl: 3600
fireedge:
  type: A
  value: {{eth0}}
  ttl: 3600
zabbix:
  type: A
  value: {{eth0}}
  ttl: 3600
valheim:
  type: A
  value: {{eth0}}
  ttl: 3600
minecraft:
  type: A
  value: {{eth0}}
  ttl: 3600
thelounge:
  type: A
  value: {{eth0}}
  ttl: 3600
cloudkey:
  type: A
  value: 192.168.1.3
  ttl: 3600
jonagold:
  type: A
  value: 192.168.1.26
  ttl: 3600
lenovo:
  type: A
  value: 192.168.1.98
  ttl: 3600
thinkpad:
  type: A
  value: 192.168.1.139
  ttl: 3600

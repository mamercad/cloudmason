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
    value: forward-email=mamercad@gmail.com
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
net:
  type: A
  values:
    - 192.168.1.10
    - 192.168.1.11
  ttl: 3600
awx:
  type: CNAME
  value: net.cloudmason.org.
  ttl: 3600
jonagold:
  type: A
  value: 192.168.1.26
  ttl: 3600
lenovo:
  type: A
  value: 192.168.1.89
  ttl: 3600

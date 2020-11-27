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

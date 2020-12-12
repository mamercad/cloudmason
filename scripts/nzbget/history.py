#!/usr/bin/env python3

import os
import sys
import time
import xmlrpc.client

try:
	last = int(60*60*int(sys.argv[1]))
except Exception as e:
  last = 3600 # last 1h

# last = 3600 # last 1h

host = os.getenv('NZBOP_CONTROLIP')
port = os.getenv('NZBOP_CONTROLPORT')
username = os.getenv('NZBOP_CONTROLUSERNAME')
password = os.getenv('NZBOP_CONTROLPASSWORD')

now = time.time()
rpcUrl = 'http://%s:%s@%s:%s/xmlrpc' % (username, password, host, port)
server = xmlrpc.client.ServerProxy(rpcUrl)

d = []
for h in server.history():
	age = int(now-h['HistoryTime'])
	if age < last:
		d.append({
			'id': h['ID'],
			'name': h['Name'],
			'status': h['Status'],
			'age': int(now-h['HistoryTime'])
		})
print(d)

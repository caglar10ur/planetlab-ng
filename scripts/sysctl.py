#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc
client = fc.Client("*")

q = client.sysctl.list()
for i in q:
	print i
	for j in q[i]:
		print j
	print

print client.sysctl.get('net.ipv4.icmp_echo_ignore_broadcasts')

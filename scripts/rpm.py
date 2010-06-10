#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc
client = fc.Client("*")

q = client.rpms.inventory(True)
for i in q:
	print i
	for j in q[i]:
		print j
	print

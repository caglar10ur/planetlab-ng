#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc
client = fc.Client("*")

m = client.process.mem()

print "[Private, Shared, Total RAM used, Program]"
for i in m:
	print i
	for j in m[i]:
		print j
	print

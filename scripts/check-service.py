#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc
client = fc.Client("*")

q = client.service.status("puppet")
for i in q:
	print i,q[i]
	print

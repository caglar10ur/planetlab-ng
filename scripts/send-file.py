#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc

client = fc.Client("*")
client.local.copyfile.send("/etc/resolv.conf","/tmp/file")

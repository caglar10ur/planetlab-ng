#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc

client = fc.Client("*")
print client.mount.list()

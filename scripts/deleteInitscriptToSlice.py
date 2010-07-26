#!/usr/bin/python
#-*- coding: utf-8 -*-

import func.overlord.client as fc

node_name = "planetlab-02.cs.princeton.edu"
slice_name = "princeton_caglar"

script = [{'initscript_id': 13, 'enabled': True, 'name': u'princeton_caglar', 'script': u'#!/bin/bash\n\necho "TEST" > /tmp/test\n'}]

client = fc.Client(node_name, timeout=10, async=False)
if client.test.ping():
    client.nm.DeleteSliceTag(slice_name, "initscript", script)
else:
    print ("Couldn't reach to %s" % node_name)


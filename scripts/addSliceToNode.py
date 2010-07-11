#!/usr/bin/python
#-*- coding: utf-8 -*-

import os, time, sys, string, re, traceback
import xmlrpclib

import func.overlord.client

plc = xmlrpclib.ServerProxy("https://www.planet-lab.org/PLCAPI/", allow_none = True)

auth = {}
auth["Username"] = "USERNAME"
auth["AuthString"] = "PASSWORD"
auth["AuthMethod"] = "password"

node_name = "planetlab-02.cs.princeton.edu"
slice_name = "princeton_caglar"
slice_name_fake = "princeton_caglar_test"

try:
    slice = plc.GetSlices(auth, slice_name)[0]
    tags = plc.GetSliceTags(auth, slice["slice_tag_ids"], ['tagname', 'value'])
    keys = plc.GetKeys(auth, {'person_id': slice["person_ids"], 'key_type': 'ssh'}, ['key'])
except:
    tags = []
    keys = []

client = func.overlord.client.Client(node_name, timeout=10, async=True)
if client.test.ping():
    client.vservermanager.AddSliceToNode(slice_name_fake, tags, keys)
else:
    print ("Couldn't reach to %s" % node_name)

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
key_id = 20184

try:
    slice = plc.GetSlices(auth, slice_name)[0]
    keys = plc.GetKeys(auth, {'person_id': slice["person_ids"]}, ['key', 'key_type'])
    keys.remove(plc.GetKeys(auth, {'person_id': key_id}, ['key', 'key_type'])[0])
except:
    keys = []

client = func.overlord.client.Client(node_name, timeout=10, async=True)
if client.test.ping():
    client.nm.AddPersonToSlice(slice_name, keys)
else:
    print ("Couldn't reach to %s" % node_name)

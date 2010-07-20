#!/usr/bin/python
#-*- coding: utf-8 -*-

import os, time, sys
import pwd, grp

sys.path.append("/usr/share/NodeManager/")

from config import Config
from plcapi import PLCAPI

from func.minion.modules import nm

# Load /etc/planetlab/session
session = "/etc/planetlab/session"
if os.path.exists(session):
    session = file(session).read().strip()
else:
    session = None

# Load /etc/planetlab/plc_config
config = Config("/etc/planetlab/plc_config")

# Initialize XML-RPC client
plc = PLCAPI(config.plc_api_uri, config.cacert, session)

# check auth
while plc.check_authentication() != True:
    try:
        plc.update_session()
    except Exception,e:
        print "Authentication failed"
    time.sleep(10)


node_id = int(file("/etc/planetlab/node_id").read().strip())
nodes = plc.GetNodes( node_id, ["nodegroup_ids", "slice_ids"])[0]

slice_id = nodes["slice_ids"]
nodegroup_id = nodes["nodegroup_ids"]

slices = plc.GetSlices( { "slice_id" : slice_id }, ["name", "slice_tag_ids", "person_ids", "instantiation"] )

system_slice_ids = [slice["slice_id"] for slice in plc.GetSliceTags( { "tagname": "system", "value": "1"}, ["slice_id"])]
system_slices = plc.GetSlices( { "slice_id" : system_slice_ids }, ["name", "slice_tag_ids", "person_ids", "instantiation"] )

# FIXME: Delegation ?= System
controller_and_delegated_slices = plc.GetSlices( { "instantiation": ["nm-controller", "delegated"] }, ["name", "slice_tag_ids", "person_ids", "instantiation"] )

slice_names = [slice["name"] for slice in slices]
system_slice_names = [slice["name"] for slice in system_slices]
controller_and_delegated_slice_names = [slice["name"] for slice in controller_and_delegated_slices]

gid = grp.getgrnam("slices")[2]
slivers = [pw_ent[0] for pw_ent in pwd.getpwall() if pw_ent[3] == gid]

garbage_slivers = set(slivers) - set(slice_names + system_slice_names + controller_and_delegated_slice_names)
missing_slivers = set(slice_names + system_slice_names + controller_and_delegated_slice_names) - set(slivers)
existing_slivers = set(slivers) - set(system_slice_names + controller_and_delegated_slice_names)

for slice in garbage_slivers:
    print "GARBAGE %s" % slice
    v = nm.NM()
    v.DeleteSliceFromNode(slice)


for slice in slices + system_slices + controller_and_delegated_slices:

    if slice["name"] in missing_slivers:
        try:
            tags = plc.GetSliceTags({ "slice_tag_id" : slice["slice_tag_ids"] }, ["tagname", "value", "node_id", "nodegroup_id"]) 
            keys = plc.GetKeys({ "person_id": slice["person_ids"], "key_type": "ssh" }, ["key"])
        except:
            tags = []
            keys = []
 
        filtered_tags = [] 
        for tag in tags:
            if tag["node_id"] == node_id or tag["nodegroup_id"] == nodegroup_id or (tag["node_id"] == None and tag["nodegroup_id"] == None):
                filtered_tags += tag

        #FIXME: ignoring delegated/system slices for now
        if slice["name"] in system_slice_names + controller_and_delegated_slices:
            print "IGNORING %s" % slice["name"]
        else:
            print "MISSING %s" % slice["name"]
            v = nm.NM()
            v.AddSliceToNode(slice["name"], filtered_tags, keys)

    elif slice["name"] in existing_slivers:
        #FIXME: ignoring existing slices for now
        print "EXISTING %s" % slice["name"]
        #keys = plc.GetKeys({ "person_id": slice["person_ids"], "key_type": "ssh" }, ["key"])
        #v = nm.NM()
        #v.AddPersonToSlice(slice["name"], keys)

    elif slice["name"] in controller_and_delegated_slice_names:
        #FIXME: ignoring delegated/system slices for now
        print "DELEGATED %s" % slice["name"]

    elif slice["name"] in system_slice_names:
        #FIXME: ignoring delegated/system slices for now
        print "SYSTEM %s" % slice["name"]

    else:
        print "HUH %s" % slice["name"]

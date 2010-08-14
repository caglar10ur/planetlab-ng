#!/usr/bin/python
#-*- coding: utf-8 -*-

import xmlrpclib

plc = xmlrpclib.ServerProxy('https://www.planet-lab.org/PLCAPI/', allow_none = True)

auth = {}
auth['Username'] = "caglar@cs.princeton.edu"
auth['Username'] = "USERNAME"
auth['AuthString'] = "PASSWORD"

if __name__ == "__main__":
        sites = plc.GetSites(auth, {'enabled': True})
        for site in sites:
                nodes = [node["hostname"] for node in plc.GetNodes(auth, site["node_ids"])]
                print "[%s]\nhost = %s\n\n" % (site["login_base"], ",".join(nodes))

        groups = plc.GetNodeGroups(auth)
        for group in groups:
                nodes = [node["hostname"] for node in plc.GetNodes(auth, group["node_ids"])]
                print "[%s]\nhost = %s\n" % (group["name"], ",".join(nodes))


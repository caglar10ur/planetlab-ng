#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import func.overlord.client

fc = func.overlord.client.Client('*', timeout=5, nforks=20)
results = fc.test.ping()

offline = []

for (hn, out) in results.items():
    if out != 1:
        offline.append(hn)

print '\n'.join(offline)

#!/usr/bin/python
# -*- coding: utf-8 -*-

import func.overlord.client as fc
import func.jobthing as jobthing
from time import sleep

client = fc.Client("*", nforks=10, async=True)
job_id = client.yumcmd.update()

while True:
        status = client.job_status(job_id)
        (code, results) = status

        if code == jobthing.JOB_ID_RUNNING:
                print "task is still running..."
        elif code == jobthing.JOB_ID_PARTIAL:
                print "task reports partial status, results = %s" % results
        elif code == jobthing.JOB_ID_FINISHED:
                print "(async) task complete, results = %s" % results
                break
        elif code == jobthing.JOB_ID_LOST_IN_SPACE:
                print "(async) task lost in space, results = %s" % results
        sleep(1)

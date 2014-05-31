#!/usr/bin/python


import subprocess

proc = subprocess.Popen(["xbacklight"], stdout=subprocess.PIPE, shell=True)
(out, err) = proc.communicate()
print(int(float((out.decode("utf-8")).replace("\n",""))))

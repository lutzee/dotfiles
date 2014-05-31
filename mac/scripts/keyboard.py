#!/usr/bin/python


import subprocess

proc = subprocess.Popen(["/home/lutzee/scripts/.kbdlight.sh"], stdout=subprocess.PIPE, shell=True)
(out, err) = proc.communicate()
#print(subprocess.check_output())
final=out.decode("utf-8")
final = (100/255)*float(final)
print(round(final))

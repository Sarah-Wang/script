#!/usr/bin/python
import json
import os
import sys

def msgfmt(msg):
    b=msg.replace('\\','')
    print "**new msg: ",msg
    print "##b: ", b
    return b

stra=r'[fix: \"just ignore this \"\"\"|http://pcbugit2.realsil.com.cn:8080/#/c/10490]'
print "stra: ",stra
strb = msgfmt(stra)
print strb

s="fix: another test for \'\"\"\'"
s1 = json.dumps({"body":s})
print s1



p=os.getpid()
print p
fn=str(p)+".json"
print fn
fp = open(fn,"w+")
fp.write(s1)
fp.close()
res = os.path.isfile(fn)
print res
path = os.getcwd()
print path

origin = sys.stdout
fo = open("/dev/null","w")
sys.stdout = fo
print "hhhh"
print "hhhh"
sys.stdout = origin
fo.close()


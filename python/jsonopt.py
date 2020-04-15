#!/usr/bin/python
import json

data =  { 'a' : 1, 'b' : 2, 'c' : 3, 'd' : 4, 'e' : 5 } 

jd = json.dumps(data)
print jd

jsonData = '{"a":1,"b":2,"c":3,"d":4,"e":5}';

text = json.loads(jsonData)
print text

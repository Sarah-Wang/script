#!/usr/bin/python
# -*- coding: UTF-8 -*-

import re
def use_match0():
	print(re.match('www', 'www.runoob.com').span())  # 在起始位置匹配
	print(re.match('www', 'www.runoob.com'))  # 在起始位置匹配
	print(re.match('com', 'www.runoob.com'))         # 不在起始位置匹配

def use_match():
	line = "Cats are smarter than dogs"
	matchObj = re.match( r'(.*) are (.*?) .*', line, re.M|re.I) 
	if matchObj:
		print "matchObj.group() : ", matchObj.group()
		print "matchObj.groups() : ", matchObj.groups()
		print "matchObj.group(1) : ", matchObj.group(1)
		print "matchObj.group(2) : ", matchObj.group(2)
	else:
		print "No match!!"

def use_search():
	line = "Cats are smarter than dogs"; 
	searchObj = re.search( r'(.*) are (.*?) .*', line, re.M|re.I) 
	if searchObj:
		print "searchObj.group() : ", searchObj.group()
		print "searchObj.group(1) : ", searchObj.group(1)
		print "searchObj.group(2) : ", searchObj.group(2)
	else:
		print "Nothing found!!"

def use_sub():
	#re.sub(pattern, repl, string, count=0, flags=0)
	#repl : 替换的字符串，也可为一个函数。
	phone = "2004-959-559 # 这是一个国外电话号码" 
	# 删除字符串中的 Python注释 
	num = re.sub(r'#.*$', "", phone)
	print "电话号码是: ", num
	
	# 删除非数字(-)的字符串 
	num = re.sub(r'\D', "", phone)
	print "电话号码是 : ", num

# 将匹配的数字乘于 2
def double(matched):
	value = int(matched.group('value'))
	return str(value * 2) 
s = 'A23G4HFD567'
print(re.sub('(?P<value>\d+)', double, s))
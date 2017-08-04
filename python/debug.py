#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os

def simpledbg():
	try:
		os.rmdir("testdir")
	except:
		print "unexcepted error occurred"
	else:
		print "rmdir done"
#simpledbg()


def filedbg(filename):
	try:
		fh = open(filename, "r+")
		fh.write("test line")
	except IOError:
		print "IOError: file not found for failed to read/write"
	else:
		print "write file successfully"
		fh.close()
#filedbg("unknown")

#try-finally 语句无论是否发生异常都将执行最后的代码。
def finaldbg():
	try:
		fh = open("testfile", "w")
		fh.write("这是一个测试文件，用于测试异常!!")
	finally:
		print "Error: 没有找到文件或读取文件失败"
#finaldbg()

def finaldbg1():
	try:
		fh = open("testfile", "w")
		try:
	 		fh.write("这是一个测试文件，用于测试异常!!")
		finally:
	 		print "关闭文件"
			fh.close()
	except IOError:
		print "Error: 没有找到文件或读取文件失败"
#finaldbg1()


def temp_convert(var):
    try:
        return int(var)
    except ValueError, Argument:
        print "参数没有包含数字\n", Argument
#temp_convert("xyz");


# 自己触发异常
#raise [Exception [, args [, traceback]]]
def mye(level):
    if level < 1:
		raise Exception("Invalid level!", level)
		# 触发异常后，后面的代码就不会再执行
def dbgmye():
	try:
		#触发异常
		mye(0)
	except "Invalid level!":
		print 1
	else:
		print 2
#dbgmye()

class MyError(Exception):
#class MyError(RuntimeError):
#class MyError():
	def __init__(self, arg):
		self.args = arg

def myerrdbg():
	try:
		raise MyError("error message")
	except MyError, e:
		print e.args
myerrdbg()
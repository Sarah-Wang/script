#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os


def getinput0():
	s = raw_input("Please input one line words: ")
	print "you input: ", s
#getinput0()


#input expects a input valid to python
def getinput1():
	s = input("Please input something: ")
	#s = input([x*5 for x in range(2,10,2)])  ---> [10, 20, 30, 40]
	#s = input(4)
	#s = input("this is string")
	print "you input: ", s
#getinput1()


def fileOptions(filename):
	fp = open(filename, "r+")
	print "filename: ", fp.name
	print "closed? ", fp.closed
	print "accss mode: ", fp.mode
	print "softspace at the end? ", fp.softspace

	#read([count])被传递的参数是要从已打开文件中读取的字节计数。
	#该方法从文件的开头开始读入
	#如果没有传入count，它会尝试尽可能多地读取更多的内容，很可能是直到文件的末尾。
	contents = fp.read()
	print "contents is: ", contents

	#tell()方法告诉你文件内的当前位置；
	#换句话说，下一次的读写会发生在文件开头这么多字节之后。
	p = fp.tell()
	print "current position: ", p

	#write()方法可将任何字符串写入一个打开的文件。
	#需要重点注意的是，Python字符串可以是二进制数据，而不是仅仅是文字。
	#write()方法不会在字符串的结尾添加换行符('\n')
	fp.write("this line is new with \n.")
	fp.writelines(["line1\n","line2\n"])

	#seek（offset [,from]）方法改变当前文件的位置。
	#Offset变量表示要移动的字节数。From变量指定开始移动字节的参考位置。
	#如果from被设为0，这意味着将文件的开头作为移动字节的参考位置。
	#如果设为1，则使用当前的位置作为参考位置。
	#如果它被设为2，那么该文件的末尾将作为参考位置。
	fp.seek(-(fp.tell()), 2)

	p = fp.tell()
	print "current position: ", p


	fp.close()

	#os.rename(current_file_name, new_file_name)
	#os.rename(filename,filename+"_new")
	#os.remove(filename+"_new")
#fileOptions("testfile")


def dirOptions(dirname):
	os.mkdir(dirname)
	os.chdir(dirname)
	pwd = os.getcwd()
	print pwd
	os.chdir("..")
	os.rmdir(dirname)
#dirOptions("testdir")


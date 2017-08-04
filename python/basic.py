#!/usr/bin/python
# -*- coding: UTF-8 -*-
#如果代码中出现了中文，必须指定为UTF-8编码格式
print "今日微晴"


Money = 2000
def AddMoney():
   # 如果要给函数内的全局变量赋值，必须使用 global 语句
	global Money
	Money = Money + 1 
	print Money
AddMoney()
print Money


# dir() 函数一个排好序的字符串列表，内容是一个模块里定义过的名字。
import math
def getAllFunc(modename):
	funcs = dir(modename)
	print funcs
#getAllFunc(math)


#如果在函数内部调用 locals()，返回的是所有能在该函数里访问的命名。
#如果在函数内部调用 globals()，返回的是所有在该函数里能访问的全局名字。
#两个函数的返回类型都是字典。所以名字们能用 keys() 函数摘取。
def getLocals():
	l = locals()
	print "locals: ", l
def getGlobals():
	g = globals()
	print "globals: ", g

#getLocals()
#getGlobals()


#reload()函数将以前导入过的模块再加载一次
#包括最初导入模块时应用的分析过程和初始化过程。
#这样就允许在不退出解释器的情况下重新加载已更改的Python模块。
def reloadmod(modname):
	reload(modname)
	print "example: reload(mymodule)"

#python包就是文件夹,但该文件夹下必须存在 __init__.py 文件, 该文件内容可以为空。
#__int__.py用于标识当前文件夹是一个包。

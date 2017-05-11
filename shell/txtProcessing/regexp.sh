#!/bin/sh
lable="<H1>Chapter 1 – Introduction to Regular Expressions</H1>"
#贪婪匹配
echo "$lable" | grep -E "<.*>"
#也是贪婪匹配
echo "$lable" | grep -E "<.*?>"
url="http://www.runoob.com:80/html/html-tutorial.html"
#^[a-zA-Z0-9_]{1,}$ //所有包含一个以上的字母、数字或下划线的字符串 
#^[1-9][0-9]*$ //所有的正整数
#^\-{0,1}[0-9]{1,}$ //所有的整数
#^[-]?[0-9]+\.?[0-9]+$ //所有的浮点数
#^\-?[0-9]{1,}\.?[0-9]{1,}$ //所有浮点数
#^[a-zA-Z0-9_]+$ //所有包含一个以上的字母、数字或下划线的字符串 
#^[0-9]+$ //所有的正整数
#^\-?[0-9]+$ //所有的整数
#^\-?[0-9]+\.?[0-9]*$ //所有的浮点数
#^Chapter|Section [1-9][0-9]{0,1}$  //匹配Chapter 或者Section 14
#^(Chapter|Section) [1-9][0-9]{0,1}$  //匹配Section 14h或Chapter 14,括号将捕获匹配到的字符并缓存供之后使用
#^(?:Chapter|Section) [1-9][0-9]{0,1}$ //匹配Section 14h或Chapter 14,?:表明不缓存匹配项
#Windows(?=95 |98 |NT ) //从任何匹配括号内匹配项的字符串开始处匹配查找字符串
#Windows(?!95 |98 |NT ) //从任何不匹配括号内的匹配项的字符串出匹配查找字符串

#!/bin/sh
#for循环列表测试
f1="abcdef"
f2="a b c d"
for i in $f1
do
	echo $i
done

for i in $f2
do
	echo $i
done


#删除文件中的空白行
#for test----------------------
for files in `ls out*`
do
        sed -e "/^$/d" $files > $files.tmp
        mv $files.tmp $files
done

#循环中使用expr
#for test----------------------
cnt=0
#列出当前路径下的文件列表
for files in *
do
        cnt=`expr $cnt + 1`
        echo $cnt ": " $files
done
echo there are $cnt files in `pwd`

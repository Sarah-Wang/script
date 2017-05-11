#!/bin/sh
#!/bin/sh -xv
#用set -x/+x打开关闭调试功能
for i in {1..3}
do
	set -x
	echo debug $i ...
	set +x
done
#set +x


#自定义调试信息
function DEBUG(){
[ "z$_DEBUG" == "zon" ] && $@ || :
}
#:告诉shell什么都不做

for i in {1..10}
do
	DEBUG echo $i
done

#运行实例： _DEBUG=on ./debug.sh

#这种将cat输出赋值给一个变量的方式会丢失回车和部分空格
echo lost space-----
out=$(cat test.txt)
echo $out
out="$(cat test.txt)"
echo $out
out=`cat -n test.txt`
echo $out

#用（）进入子进程
pwd;
(cd /home/; ls);
pwd;

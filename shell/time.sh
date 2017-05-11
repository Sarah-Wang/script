#!/bin/sh
start=$(date +%s)
sleep 3
end=$(date +%s)
diff=$(( end - start  ))
echo time taken: $diff seconds.

#间隔1s显示0-10
echo -n Count:
#save the cursor position
tput sc   #保存光标的位置
count=0;
while true;
do
	if [ $count -lt 10 ];  #注意：if后必须有空格，[]内部也必须有空格，否则会报错：syntax error near unexpected token `then'
		then let count++;   #count加1
		sleep 1;      #睡眠1秒
		tput rc       #恢复光标位置
		tput ed      #删除光标位置到行尾的所有内容，即清除旧的行值并可写入新值
		echo -n $count;    #不输出末尾的新行
	else
		echo
		exit 0;
	fi
done

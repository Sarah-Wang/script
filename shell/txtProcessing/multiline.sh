#!/bin/sh
#filename: multiline.sh

#从标准输入读取多行内容，如 echo -e "1\n2\n3" | ./multiline.sh
readStdin()
{
	while read line
	do
		echo $line
	done
}

#从文件读取多行输入
readFile()
{
	while read line
	do
		echo $line
	done < multiline-file
}

#各种判断形式
#条件与的两种写法
judge()
{
	if [ -z "${var:-}" ] && [ -z "${var2:="new"}" ]; then
		echo "both condition true!"
	fi

	if [ -z "${var:-}" -a -z "${var2:="new"}" ]; then
		echo "both condition true!"
	fi
}

#整形运算，4种方法; 整数哦！！！
#let   $[  ]  $((  ))  expr
integerOpt(){
	A=1
	B=2
	#使用let时，变量前不需要加$,但是加上也不会错～
	let C=A+B
	echo "A=1,B=2,C=$C"
	let C=$A-$B
	echo "A=1,B=2,C=$C"
	no1=1
	let no1++
	let no1--
	#使用[]; []前面的$一定要写，但是[]里面的变量写不写$都行
	#var=$[$var1+$var2]和var=$[var1+var2]一样
	no3=1
	no4=2
	result1=$[$no3+$no4]
	echo result1 is $result1
	echo "result2=$[no3+no4]"

	#使用((  ))，括号内变量写不写$都行,var=$(($a+$b))，var=$((a+b))都对
	echo "using (( ))"
	echo "at first, no5=1,no6=2"
	no5=1
	no6=2
	echo "result=$((no5+no6))"
	result=$(($no5+$no6))
	echo result is $result

	#使用expr命令,要使用反引号,expr后面的操作数中间必须有空格
	#expr只支持整数运算，对浮点数无能为力
	result1='expr 3 + 4'
	echo result1 is $result1
	echo "at first, no7=1,no8=2"
	no7=1
	no8=2
	result2=$(expr $no7 + $no8)
	echo result2 is $result2
	#乘法*需要用反斜杠转义
	expr 9 \* 4
	expr 8 % 3
	expr 5 / 2
}
floatOpt(){
	#bc,shell中还是用非交互模式吧，与echo配合
	#支持数学三角函数和指数运算等，可用scale指定浮点精度（小数点后位数）
	echo "scale=5;9+8-7*6"|bc
	#sin()--s; arctan()---a; -l指定引用库
	echo "4*a(1)" | bc -l
	echo "s(1/3*a(1))" |bc -l

	#指数
	echo "5^3" | bc
	#平方根
	echo "sqrt(49)" | bc
}
fileOpt(){
	#文件描述符0/1/2，分别代表/dev/stdin; /dev/stdout; /dev/stderr
	# > file表示将输入以覆盖方式写入file中
	# >> file表示将输入以追加方式写入file中
	#< file 从file中获取输入数据
	#cmd << EOF YOUR DOCUMENT EOF 表示从屏幕获取输入给cmd，直到遇到EOF为止。
	#EOF可以替换为其他任意字符
	#cmd << "EOF" YOUR DOCUMENT EOF如果后续文本中包含变量，则不展开。
	#cmd <<- EOF YOUR DOCUMENT EOF，会将YOUR DOCUMENT的前导TAB删除掉
	#注意：最后一个EOF前后不能包含任何空格或TAB！！
	#注释多行shell代码的方法
		#:<< BLOCK
		#COMMENTS HERE
		#BLOCK
	#如果注释行中有反引号，可以请单引号帮忙，即:<< 'BLOCK DOCUMENT BLOCK'
		#或者干脆用:<< ' DOCUMENT '
	cat << EOF >output.txt
	echo $1
EOF
	cat << "EOF" >>output.txt
	echo $1
EOF
	cat <<- "EOF" >>output.txt
	echo $1
EOF

	:<< Block
	ls
	cd ..
Block

	#自定义文件描述符
	#创建文件描述符fd用于写入,fd>=3
	exec 4>outfile
	echo "test for exec fd" >&4
	#创建文件描述符用于追加
	exec 5>>outfileadd
	echo "append txt test" >&5
	#创建文件描述符用于读取
	exec 6<input.txt
	cat <&6
	#close fd
	exec 6<&-
	exec 4<&-
	exec 5<&-
}

fileOpt param1

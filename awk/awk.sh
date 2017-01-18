#!/bin/sh

awk -F: '{print $1}' /etc/passwd | tee users
awk  -F: '{print $1,$3,$6}' OFS="\t" /etc/passwd

echo
echo "------   fs=; or fs=:  ------"
awk  -F '[;:]' '{print $1,$3,$6}' OFS="\t" /etc/passwd

echo 
echo "--- count the total size of file in current directory----"
ls -l | awk '$1~/^[^d]/ {print $NF; sum+=$5} END {print "total file size is: "sum}'

echo
echo "--- count the memory space users process consumed by RSS ---"
ps aux | awk 'NR!=1{a[$1]+=$6;} END {for (i in a) print i ": " a[i]"KB"}'

echo
echo 从file文件中找出长度大于40的行
awk ' l56=length($5)+length($6) {print l56 }' netstat.txt
awk 'length($5) + length($6)>30' netstat.txt
 
echo
echo 按连接数查看客户端IP
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr

echo
echo 打印99乘法表
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'

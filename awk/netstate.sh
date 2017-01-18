#!/bin/sh

echo "------------print \$1, \$4---------------"
awk '{print $1, $4}' netstat.txt

echo "------------printif with specific format---------------"
awk '{printf "%-8s %-8s %-8s %-25s %-25s %-20s\n",$1,$2,$3,$4,$5,$6}' netstat.txt
echo
echo "----filter-----"
echo "-----\$3==0 && \$6==\"SYN_SENT\"-----"
awk '$3==0 && $6=="SYN_SENT"' netstat.txt
echo
echo "------\$3>0 {print \$0}----"
awk '$3>0 {print $0}' netstat.txt
echo
echo "----\$3>0 && \$6==\"SYN_SENT\" || NR==1'----"
awk '$3>0 && $6=="SYN_SENT" || NR==1' netstat.txt
echo
echo "----printf the above results with specific format---"
awk '$3>=0 && $6=="SYN_SENT" || NR==1 {printf "%-25s %-25s %s\n",$4,$5,$6}' netstat.txt

echo
echo "printf including NR,FNR,4,5,6"
awk '$3>=0 && $6=="ESTABLISHED" || NR==1 {printf "%02s %s %-20s %-20s %s\n",NR, FNR, $4,$5,$6}' netstat.txt

echo
echo "---match \$6 ~/EST/----"
awk '$6 ~/EST/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt

echo
echo "---match \$6 ~/EST|SENT/"
awk '$6 ~/EST|SENT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt

echo
echo "---match \$6 !~/SENT/"
awk '$6 !~/SENT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt

echo
echo "重定向，不出第一行，将输出按\$6输出到不同的文件中"
awk 'NR!=1{print > $6}' netstat.txt

awk 'NR!=1{print $4,$5> $6}' netstat.txt

echo 
echo "----using programming rules----"
awk 'NR!=1{if($6 ~/SENT/) print > "sent.txt";
else if($6 ~/EST/) print > "estable.txt";
else print > "other.txt"}' netstat.txt

awk 'NR!=1 {a[$6]++} END {for (i in a) print i ": " a[i]}' netstat.txt

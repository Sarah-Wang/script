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

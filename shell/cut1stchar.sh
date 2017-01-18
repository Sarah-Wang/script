#!/bin/sh
#set -x
# remove the first # in the beginning of a line---------
# here, the # can be replaced by any char --------------
# note: this will remove the blanks in the beginning ----

while read line
do
	left=${line%%#*}
	if [ -z ${left} ]; then
		right=${line#*#}
		new=${left}${right}
		echo $new
	else
		new=${line}
	fi
	echo $new >> $1.tmp
done  < $1
#mv $1.tmp $1

cp $1 $1.tmp
 awk '{if($1~/^#/) $1=substr($1,2); print $0}' $1.tmp

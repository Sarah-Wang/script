#!/bin/sh


#$1: paramiter
#$2: path

DBG_MD="./dbg_md"
result=

run_with_paramiter()
{
	$DBG_MD $1 $2 | while read i j; do
		#if echo $i | grep "^motion" > /dev/null; then
		if echo $i | grep "^motion" > /dev/null; then
			echo $i $j
			j=${j#frame}
			j=${j#[}
			j=${j%]}
			result="$result $j"
			echo $result
			echo "a"
		fi
	done
	echo $result
}

set -x

run_with_paramiter "-n 10 -s6"



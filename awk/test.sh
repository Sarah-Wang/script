#!/bin/sh
#eval echo the last argument is \$$#
#shift `expr $# - 1`
#while [ $# -gt 0 ]
#do
    #case $1 in
        #-u) echo "-u selected"
            ##do something here
            #shift
            #;;
        #-l) echo "-l selected"
            ##do something here
            #shift
            #;;
        #*) echo "invalid arguments"
            #exit
            #;;
    #esac
#done

#getopts examples---------
#ALL=false
#HELP=false
#FILE=false
#VERBOSE=false
#COPT=0
#while getopts :ahfvc: OPTION
#do
    #case $OPTION in
        #a)ALL=true
            #echo "ALL IS $ALL"
            #;;
        #h)HELP=true
            #echo "HELP IS $HELP"
            #;;
        #f)FILE=true
            #echo "FILE IS $FILE"
            #;;
        #v)VERBOSE=true
            #echo "VERBOSE IS $VERBOSE"
            #;;
        #c)COPT=$OPTARG
            #echo "COPT IS $COPT"
            #;;
        #\?)echo "`basename $0` -[a h f v] -[c value]"
            #;;
    #esac
#done

#set examples--------- 
#set argument1 argument2
#while [ $# != 0 ]
#do 
 #   echo $1
 #   shift
#done
test(){
    sleep 5
}
time test

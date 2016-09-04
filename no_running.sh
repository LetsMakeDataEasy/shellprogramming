#!/bin/sh

## Check whether a process exists by command string pattern
## Expected usage: ./no_running.sh java && ./start_java.sh

number_of_arguments=$#
file_name=$0

if [ $number_of_arguments -eq 0 ]
then
   echo "Usage: $file_name process_pattern"
   exit 1
fi

process_pattern=$1
process_count=`ps -A -ww | grep [^]]$process_pattern | grep -v [^]]$file_name | wc -l`

# if/else syntax
if [ $process_count -eq 0 ]
then
    exit 0  #There No running process of pattern $process_pattern"
else
    exit 1 #There $process_count process of pattern $process_pattern"
fi

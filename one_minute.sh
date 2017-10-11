#!/bin/bash
#cronta最低每一分钟执行，低于一分钟的事情，此时就要用sleep
step=5 #间隔时间，不能大于60
for (( i = 0; i < 60 ; i=(i+step))); do
	ls
	endtime=`date +"%Y-%m-%d %H:%M:%S"`
	echo "★{$endtime}执行成功"
	sleep $step
done

exit 0

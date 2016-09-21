#!/bin/bash
#检测服务是否在运行,若不在则启动
soft=(nginx php-fpm mysqld redis) 
for S in "${soft[@]}";do 
	ps=`pstree | grep $S` 
	if [ "$ps" == "" ]; then 
		`service $S start` 
	fi 
done

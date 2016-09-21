#!/bin/bash
#written by mofansheng@2015-10-15
 
port=`netstat -nlt|grep 3306|wc -l`
if [ $port -ne 1 ]
then
 #/etc/init.d/mysqld start
`service mysqld start`
else
 echo "MySQL is running"
fi

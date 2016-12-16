#!/bin/bash
#检测服务是否在运行,若不在则启动
soft=(nginx php-fpm mysqld redis) 
for S in "${soft[@]}";do 
	ps=`pstree | grep $S` 
	if [ "$ps" == "" ]; then 
		`service $S start` 
	fi 
done

#只检测mysql是否在运行建议使用下面
result=`/usr/bin/mysqladminping`
expected='mysqld is alive'

if[[ "$result"!= "$expected"]]
then
echo"It's dead - restart mysql"
    
# email subject
SUBJECT="[MYSQL ERROR] - Attempting to restart service"    
# Email To ?
EMAIL="info@endyourif.com"    
# Email text/message
EMAILMESSAGE="/tmp/emailmessage.txt"
echo"$result was received"> $EMAILMESSAGE
echo"when we were expected $expected">>$EMAILMESSAGE
# send an email using /bin/mail
mail -s "$SUBJECT""$EMAIL"< $EMAILMESSAGE
   
sudo/etc/init.d/mysqlrestart
fi

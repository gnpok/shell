#!/bin.bash
status=`netstat -anlp|grep 80|grep tcp|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -nr|head -n20 | netstat -ant |awk '/:80/{split($5,ip,":");++A[ip[1]]}END{for(i in A) print A[i],i}' |sort -rn|head -n 1`
NUM=`echo $status|awk '{print $1}'`
IP=`echo $status|awk '{print $2}'`
result=`echo "$NUM > 200" | bc`
if [ "$result" == 1 ]; then
	`iptables -I INPUT -s "$IP" -j DROP`
	echo $IP >> /data/logs/ip
fi

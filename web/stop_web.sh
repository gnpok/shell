soft=(nginx php-fpm mysqld redis)
for S in "${soft[@]}";do
    ps=`pstree | grep $S`
    if [ "$ps" != "" ]; then
        `sudo service $S stop`
    fi
done

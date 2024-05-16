#!/bin/bash

home=$(cd `dirname $0`; pwd)

table=$1
if [ -z "$table" ]; then
    echo "缺少table参数"
    exit 1
fi

ips=($(cat iplist.txt))
ips_size=${#ips[*]}
ip_starts=$( seq 0 $(($ips_size - 1)) )
ip_ends=$( seq 0 $(($ips_size - 1)) )

for ((i=0;i<$ips_size;i++))
do
    ip_starts[$i]=0
    ip_ends[$i]=0
done

while true ; do
    # 遍历每个节点
    for ((i=0;i<$ips_size;i++)); do
        ip=${ips[$i]}
        start=${ip_starts[$i]}
        end=${ip_ends[$i]}
        if [ $start -eq 0 ]; then
            info=$(ssh $ip "cat $home/log_$table.txt | grep migrate_table_start")
            if [ -n "$info" ]; then
                echo "${ip}迁移开始:${info}"
                ip_starts[$i]=1
                start=1
            fi
        fi
        if [ $start -eq 1 ] && [ $end -eq 0 ] ; then
            info=$(ssh $ip "cat $home/log_$table.txt | grep migrate_table_end")
            if [ -n "$info" ]; then
                echo "${ip}迁移结束:${info}"
                ip_ends[$i]=1
                end=1
            fi
        fi
    done
    
    #全部结束
    finish_cnt=0
    for ((i=0;i<$ips_size;i++)); do
        start=${ip_starts[$i]}
        end=${ip_ends[$i]}
        if [ $start -eq 1 ] && [ $end -eq 1 ] ; then
            finish_cnt=$(($finish_cnt+1))
        fi
    done
    if [ $finish_cnt -ge $ips_size ]; then
        echo "所有节点迁移结束"
        break
    fi
    
    sleep 2
done

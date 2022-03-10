#!/bin/bash

ck_username="default"                                         #ck用户名
ck_password="ceiec2019"                                       #ck密码
ck_monitor_prom_file="/home/galaxy/volumes/node-exporter/prom/ck_monitor.prom"

current1=`date "+%Y-%m-%d %H:%M:%S"`
startDate=`date -d "${current1}" +%s`
pcount=` clickhouse-client -h 127.0.0.1 --port 9001 -m -u $ck_username --password $ck_password --max_execution_time=100 --query="select count(*) from system.processes" `

current2=`date "+%Y-%m-%d %H:%M:%S"`
endDate=`date -d "${current2}" +%s`
                      diff=`expr $endDate - $startDate`


mcount=` clickhouse-client -h 127.0.0.1 --port 9001 -m -u $ck_username --password $ck_password --max_execution_time=100 --query="select count(*) from system.merges" `



echo ck_processes_count $pcount>$ck_monitor_prom_file
echo ck_merges_count $mcount>>$ck_monitor_prom_file
echo ck_connect_time $diff>>$ck_monitor_prom_file


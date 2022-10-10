#!/bin/sh

#gohangout启动文件

#配置文件名称,注意配置文件需要放在$BASE_DIR/conf文件夹下
YML_NAME=k2ck_metric_dns_rr_aaaa_cn
#gohangout的二进制启动文件路径
BASE_DIR=$(cd $(dirname $0); cd ../../; pwd)
#日志级别,1,5,10,数字越大日志越详细
LOG_LV=5
#线程总数,即开启worker数量,每个线程拥有自己的filter, output,占用多份内存,默认1个线程
THREAD_SUM=3
#进程总数
PROCESS_SUM=$1

if [ ! -d "$BASE_DIR/logs" ]; then
        mkdir -p $BASE_DIR/logs
fi

echo "###########################$(date +%Y%m%d%H%M%S)###########################" >> $BASE_DIR/bin/start_log/${YML_NAME}_restart.log
id=0
logid=0
while true ; do
    NUM=`ps -ef | grep -w ${YML_NAME}.yml | grep -v grep |wc -l`
    pids=$(ps -ef | grep -w ${YML_NAME}.yml | grep -v grep | awk '{print $2}')
    time_stamp=$(date +%Y%m%d%H%M%S)
    if [ "${NUM}" -lt ${PROCESS_SUM} ];then
	$BASE_DIR/bin/gohangout --config $BASE_DIR/conf/${YML_NAME}.yml --logtostderr --v ${LOG_LV} --worker ${THREAD_SUM} >> $BASE_DIR/logs/${YML_NAME}.log 2>&1 &
    echo "${time_stamp} ---> the ${YML_NAME}APP restart ---> $id" >> $BASE_DIR/bin/start_log/${YML_NAME}_restart.log
    ((logid++))
    ((id++))
     if [ ${logid} -gt ${PROCESS_SUM} ];then
      logid=0
      pids=$(ps -ef | grep -w ${YML_NAME}.yml | grep -v grep | awk '{print $2}')
        for pid in $pids
        do
         kill -9  $pid
        done
        echo "kafka or clickhouse is error,reset gohangout,sleep 30s... ..." >> $BASE_DIR/bin/start_log/${YML_NAME}_restart.log
        sleep 30
     fi
    #大于设置进程数,杀掉所有进程,重启
    elif [ "${NUM}" -gt ${PROCESS_SUM} ];then
        for pid in $pids
        do
         kill -9  $pid
        done
    id=0
    fi
        sleep 1
done

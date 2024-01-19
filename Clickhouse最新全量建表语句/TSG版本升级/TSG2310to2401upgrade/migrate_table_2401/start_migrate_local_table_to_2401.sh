#!/bin/bash

# 本脚本逐时间段按最新往前顺序迁移clickhouse数据，TSG23.11日志重组后数据迁移

# 迁移表 参数，可选值：session_record，security_event，monitor_event，transaction_record，voip_record，proxy_event，dos_event
table=$1
# 数据开始时间(UTC) 参数, 例如:"2023-10-26 00:00:00"
data_start_time=$2
# 数据结束时间(UTC) 参数, 例如:"2023-10-28 00:00:00"
data_end_time=$3
# 每批迁移数据时间段长度(分钟) 参数, 例如:240
slice_interval_minute=$4

timestamp_start=`date --utc --date="$data_start_time" +%s`
timestamp_end=`date --utc --date="$data_end_time" +%s`

# 校验迁移表参数
case $table in
"session_record")
    # 迁移session_record
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
"security_event")
    # 迁移security_event
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
"monitor_event")
    # 迁移monitor_event
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
"transaction_record")
    # 迁移transaction_record
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
"voip_record")
    # 迁移voip_record
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
"proxy_event")
    # 迁移proxy_event
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
"dos_event")
    # 迁移dos_event
    echo "迁移表${table}, start:$data_start_time, end:$data_end_time, interval_minute:$slice_interval_minute"
;;
*)
    echo "所迁移表${table}不在范围:session_record，security_event，monitor_event，transaction_record，voip_record，proxy_event，dos_event"
    exit 1
;;
esac

# 校验时间参数
if [ -z "$timestamp_start" ]; then
    echo "data_start_time fmt err"
    exit 1
fi

if [ -z "$timestamp_end" ]; then
    echo "data_end_time fmt err"
    exit 1
fi

if [ $timestamp_start -ge $timestamp_end ]; then
    echo "date range err"
    exit 1
fi

# 后台执行，输出日志
nohup ./migrate_local_table_to_2311.sh "$table" "$data_start_time" "$data_end_time" $slice_interval_minute >> "log_$table.txt" 2>&1 &
echo "已启动迁移${table}表任务，时间范围[$data_start_time, $data_end_time], 每批迁移段分钟:$slice_interval_minute, 日志输出到:log_$table.txt。请查看日志文件确认每段数据迁移情况"


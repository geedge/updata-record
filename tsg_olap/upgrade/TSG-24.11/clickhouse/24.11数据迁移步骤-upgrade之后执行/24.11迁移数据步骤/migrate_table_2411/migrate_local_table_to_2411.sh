#!/bin/bash

# 本脚本逐时间段按最新往前顺序迁移clickhouse数据

# 迁移表 参数，可选值：assessment_event，dos_event
table=$1
# 数据开始时间(UTC) 参数
data_start_time=$2
# 数据结束时间(UTC) 参数
data_end_time=$3
# 每批迁移数据时间段长度(分钟) 参数
slice_interval_minute=$4

timestamp_start=`date --utc --date="$data_start_time" +%s`
timestamp_end=`date --utc --date="$data_end_time" +%s`

# 需要迁移的表名称

assessment_event_table_src="tsg_galaxy_tmp.assessment_event_local_old"
assessment_event_table_dest="tsg_galaxy_tmp.assessment_event_local"

dos_event_table_src="tsg_galaxy_tmp.dos_event_local_old"
dos_event_table_dest="tsg_galaxy_tmp.dos_event_local"

# ck客户端参数
ip="127.0.0.1"
ck_port="9001"
ck_username="default"
ck_password="galaxy2019"
ck_max_execution_time=36000 # 执行insert 的超时时间秒
max_threads=2 # max_insert_threads和max_threads

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

echo "#####################start `date --utc +'%Y-%m-%d %H:%M:%S'`#######################"
echo "migrate_table_start:`date --utc +'%Y-%m-%d %H:%M:%S'`"
echo "输入参数: table:$table"
echo "输入参数: data_start_time:$data_start_time($timestamp_start)"
echo "输入参数: data_end_time:$data_end_time($timestamp_end)"

insert_success_cnt=0
insert_fail_cnt=0


migrate_assessment_event_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $assessment_event_table_dest
SELECT
*
FROM $assessment_event_table_src
where recv_time >= $input_time_start and recv_time < $input_time_end
;"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_dos_event_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $dos_event_table_dest
SELECT
    *
FROM $dos_event_table_src
where recv_time >= $input_time_start and recv_time < $input_time_end
;"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

slice_time_interval=$((60*slice_interval_minute))
data_split_part=$(((timestamp_end-timestamp_start)/slice_time_interval))

# 输出划分的时间段
show_time_range(){
    echo "split time ranges:"
    for ((i = 0 ; i <= $data_split_part ; i++))
    do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        echo "time_range:$start_time, $end_time"
    done
}



# 迁移assessment_event
migrate_assessment_event_table(){
    echo "**********start migrate $table table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_assessment_event_table_one_part $input_time_start $input_time_end
        echo "end $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate $table table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移dos_event
migrate_dos_event_table(){
    echo "**********start migrate $table table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_dos_event_table_one_part $input_time_start $input_time_end
        echo "end $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate $table table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 输出划分的时间段
show_time_range

# 校验迁移表参数
case $table in
"assessment_event")
    # 迁移assessment_event
    migrate_assessment_event_table
;;
"dos_event")
    # 迁移dos_event
    migrate_dos_event_table
;;
*)
    echo "所迁移表${table}不在范围:assessment_event，dos_event"
;;
esac

echo "migrate_table_end:`date --utc +'%Y-%m-%d %H:%M:%S'`, 成功迁移数据段:${insert_success_cnt}, 失败迁移数据段:${insert_fail_cnt}"

echo "成功迁移数据段:${insert_success_cnt}, 失败迁移数据段:${insert_fail_cnt}"

echo "#####################end `date --utc +'%Y-%m-%d %H:%M:%S'`#######################"
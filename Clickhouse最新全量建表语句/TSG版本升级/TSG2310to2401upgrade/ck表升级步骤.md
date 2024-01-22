# 说明
* 请按步骤依次执行，执行脚本报错时联系研发处理后再执行之后的步骤。  
* 所有ck步骤都需要在query节点执行
* 执行所有sql语句之前需要停止日志留存调度任务，确保ck中无分布式ddl语句H执行，否则执行的sql会阻塞住，影响后续步骤执行
验证sql需要在query节点执行
clickhouse-client -h 127.0.0.1 --port 9001 -m -u default --password ****** --query "select query  from system.distributed_ddl_queue where status =0 limit 1"
若返回结果为空则可执行升级步骤，否则需要等待。

# 一、实时同步任务

* 1.创建临时表
```sh
clickhouse-client -h 127.0.0.1 --port 9001 -m -n -u default --password ****** --distributed_ddl_task_timeout 180 < 01_create_table_2401.sql
```

* 2.创建源表同步到临时表的物化视图
```sh
clickhouse-client -h 127.0.0.1 --port 9001 -m -n -u default --password ****** --distributed_ddl_task_timeout 180 < 02_create_table_2310_to_2401_view.sql
```

# 二、升级各个数据中心(可选)

* 1.国家中心启动ck入库任务(XX_2401 task)同步临时表：创建kafka临时topic(以_2401结尾)，启动Gohangout同步到临时表任务

* 2.升级各个分数据中心：启动ETL任务发送到国家中心临时topic(以_2401结尾)

# 三、所有分中心升级完毕，临时表切换为目标表，源表切换为历史表

* 1.停止源表ck入库任务

* 2.停止ck入库临时表任务

* 3.重命名旧表和临时表
```sql
clickhouse-client -h 127.0.0.1 --port 9001 -m -n -u default --password ****** --distributed_ddl_task_timeout 180 < 03_rename_table.sql
```

* 4.执行2401版本初始化建表语句
```
clickhouse-client -h 127.0.0.1 --port 9001 -m -n -u default --password ****** --distributed_ddl_task_timeout 180 < 04_init_new_table.sql
```

* 5.校验表结构
```
clickhouse-client -h 127.0.0.1 --port 9001 -m -n -u default --password ****** --distributed_ddl_task_timeout 180 < 05_check.sql
```
无报错信息说明校验通过

* 6.启动目标表ck入库任务(升级完成)


# 四、离线同步历史数据(可选)

在query节点执行以下步骤，iplist.txt中为ck所有data节点ip地址。

步骤描述：
* 1.进入migrate_table_2401文件夹,使脚本可执行
```
chmod +x ./*.sh
```

* 2.分发迁移脚本到data节点
```
./01_send_migrate_table_scripts.sh
```

* 2.选择迁移某个表，同步需要时间区间的数据，时间区间:[实时同步任务开始时间向前推n天, 实时同步任务开始时间)，时间区间为左闭右开，不包含结束时间点。
```
# 迁移security_event表
./02_start_migrate_table.sh security_event "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
```

* 3.监控data节点迁移情况，所有表迁移完成后，确认每个节点同步数据成功/失败批次数，如有失败批次确认是否需要处理
```
# 监控security_event表迁移
./03_monitor_migrate_table.sh security_event
```

* 4.选择下个张需要迁移的表，重复2-4步骤。支持选择迁移的表有: security_event, monitor_event, session_record, transaction_record, voip_record, proxy_event, dos_event。


迁移和监控各个表执行命令示例：
```sh
# 迁移security_event表
./02_start_migrate_table.sh security_event "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控security_event表迁移
./03_monitor_migrate_table.sh security_event


# 迁移monitor_event表
./02_start_migrate_table.sh monitor_event "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控monitor_event表迁移
./03_monitor_migrate_table.sh monitor_event


# 迁移session_record表
./02_start_migrate_table.sh session_record "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控session_record表迁移
./03_monitor_migrate_table.sh session_record


# 迁移transaction_record表
./02_start_migrate_table.sh transaction_record "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控transaction_record表迁移
./03_monitor_migrate_table.sh transaction_record


# 迁移voip_record表
./02_start_migrate_table.sh voip_record "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控voip_record表迁移
./03_monitor_migrate_table.sh voip_record


# 迁移proxy_event表
./02_start_migrate_table.sh proxy_event "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控proxy_event表迁移
./03_monitor_migrate_table.sh proxy_event


# 迁移dos_event表
./02_start_migrate_table.sh dos_event "2024-01-10 00:00:00" "2024-01-20 00:00:00" 60
# 监控dos_event表迁移
./03_monitor_migrate_table.sh dos_event
```

迁移日志无报错，数据迁移完成。

如果有数据迁移失败批次，查看新老表迁移数据量对应情况(ck每台**data**节点)：
```sql
-- security_event

SELECT
    date_trunc('day', toDateTime(common_recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.security_event_local_old
WHERE common_recv_time>= toUnixTimestamp('2024-01-10 00:00:00') and common_recv_time < toUnixTimestamp('2024-01-20 00:00:00')
    and common_action in (16, 96)
group by date_trunc('day', toDateTime(common_recv_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.security_event_local
WHERE recv_time >= toUnixTimestamp('2024-01-10 00:00:00') and recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(recv_time))
order by d
;

-- monitor_event

SELECT
    date_trunc('day', toDateTime(common_recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.security_event_local_old
WHERE common_recv_time>= toUnixTimestamp('2024-01-10 00:00:00') and common_recv_time < toUnixTimestamp('2024-01-20 00:00:00')
    and common_action = 1
group by date_trunc('day', toDateTime(common_recv_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.monitor_event_local
WHERE recv_time >= toUnixTimestamp('2024-01-10 00:00:00') and recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(recv_time))
order by d
;

-- session_record

SELECT
    date_trunc('day', toDateTime(common_recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.session_record_local_old
WHERE common_recv_time>= toUnixTimestamp('2024-01-10 00:00:00') and common_recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(common_recv_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.session_record_local
WHERE recv_time >= toUnixTimestamp('2024-01-10 00:00:00') and recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(recv_time))
order by d
;

-- transaction_record

SELECT
    date_trunc('day', toDateTime(common_recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.transaction_record_local_old
WHERE common_recv_time>= toUnixTimestamp('2024-01-10 00:00:00') and common_recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(common_recv_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.transaction_record_local
WHERE recv_time >= toUnixTimestamp('2024-01-10 00:00:00') and recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(recv_time))
order by d
;

-- voip_record

SELECT
    date_trunc('day', toDateTime(common_recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.voip_record_local_old
WHERE common_recv_time>= toUnixTimestamp('2024-01-10 00:00:00') and common_recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(common_recv_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.voip_record_local
WHERE recv_time >= toUnixTimestamp('2024-01-10 00:00:00') and recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(recv_time))
order by d
;

-- proxy_event

SELECT
    date_trunc('day', toDateTime(common_recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.proxy_event_local_old
WHERE common_recv_time>= toUnixTimestamp('2024-01-10 00:00:00') and common_recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(common_recv_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(recv_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.proxy_event_local
WHERE recv_time >= toUnixTimestamp('2024-01-10 00:00:00') and recv_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(recv_time))
order by d
;

-- dos_event

SELECT
    date_trunc('day', toDateTime(start_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.dos_event_local_old
WHERE start_time>= toUnixTimestamp('2024-01-10 00:00:00') and start_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(start_time))
order by d
;
 
SELECT
    date_trunc('day', toDateTime(start_time)) d,
    COUNT(1) cnt
FROM tsg_galaxy_v3.dos_event_local
WHERE start_time >= toUnixTimestamp('2024-01-10 00:00:00') and start_time < toUnixTimestamp('2024-01-20 00:00:00')
group by date_trunc('day', toDateTime(start_time))
order by d
;
```
set distributed_ddl_task_timeout = 180;

alter table system.query_log on cluster ck_cluster modify TTL event_date + INTERVAL 60 DAY;

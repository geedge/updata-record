set distributed_ddl_task_timeout = 180;

-- 删除源表同步子表物化视图


-- 源表rename到历史表
RENAME TABLE tsg_galaxy_tmp.session_record_local to tsg_galaxy_tmp.session_record_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_tmp.security_event_local to tsg_galaxy_tmp.security_event_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_tmp.transaction_record_local to tsg_galaxy_tmp.transaction_record_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_tmp.voip_record_local to tsg_galaxy_tmp.voip_record_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_tmp.proxy_event_local to tsg_galaxy_tmp.proxy_event_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_tmp.dos_event_local to tsg_galaxy_tmp.dos_event_local_old on cluster ck_cluster;

drop table if exists  tsg_galaxy_tmp.session_record_old ON CLUSTER ck_query;
drop table if exists  tsg_galaxy_tmp.security_event_old ON CLUSTER ck_query;
drop table if exists  tsg_galaxy_tmp.transaction_record_old ON CLUSTER ck_query;
drop table if exists  tsg_galaxy_tmp.voip_record_old ON CLUSTER ck_query;
drop table if exists  tsg_galaxy_tmp.proxy_event_old ON CLUSTER ck_query;
drop table if exists  tsg_galaxy_tmp.dos_event_old ON CLUSTER ck_query;


-- 创建源分布式表old
create table IF NOT EXISTS tsg_galaxy_tmp.session_record_old ON CLUSTER ck_query (
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_tmp,session_record_local_old,rand());

create table IF NOT EXISTS tsg_galaxy_tmp.security_event_old ON CLUSTER ck_query (
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_tmp,security_event_local_old,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_tmp.transaction_record_old ON CLUSTER ck_query(
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_tmp,transaction_record_local_old,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_tmp.voip_record_old ON CLUSTER ck_query(
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_tmp,voip_record_local_old,rand());

create table IF NOT EXISTS tsg_galaxy_tmp.proxy_event_old ON CLUSTER ck_query (
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_tmp,proxy_event_local_old,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_tmp.dos_event_old ON CLUSTER ck_query(
    log_id UInt64,
    profile_id UInt64,
    start_time Int64
) ENGINE = Distributed(ck_cluster,tsg_galaxy_tmp,dos_event_local_old,rand());


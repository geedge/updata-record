set distributed_ddl_task_timeout = 180;

-- 删除源表同步子表物化视图
drop VIEW IF EXISTS tsg_galaxy_v3.common_client_ip ON CLUSTER ck_cluster;
drop VIEW IF EXISTS tsg_galaxy_v3.common_http_domain ON CLUSTER ck_cluster;
drop VIEW IF EXISTS tsg_galaxy_v3.common_server_ip ON CLUSTER ck_cluster;
drop VIEW IF EXISTS tsg_galaxy_v3.common_server_domain ON CLUSTER ck_cluster;

-- 删除源表子表相关回表
drop table IF EXISTS tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_client_ip_local ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_server_domain_local ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_server_ip_local ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_http_domain_local ON CLUSTER ck_cluster;
 
drop table IF EXISTS tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_client_ip ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_server_domain ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_server_ip ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.session_record_http_domain ON CLUSTER ck_cluster;
 
drop table IF EXISTS tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_client_ip ON CLUSTER ck_query;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_server_domain ON CLUSTER ck_query;
drop table IF EXISTS tsg_galaxy_v3.session_record_common_server_ip ON CLUSTER ck_query;
drop table IF EXISTS tsg_galaxy_v3.session_record_http_domain ON CLUSTER ck_query;

-- 源表rename到历史表
RENAME TABLE tsg_galaxy_v3.session_record_local to tsg_galaxy_v3.session_record_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.security_event_local to tsg_galaxy_v3.security_event_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.transaction_record_local to tsg_galaxy_v3.transaction_record_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.voip_record_local to tsg_galaxy_v3.voip_record_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.proxy_event_local to tsg_galaxy_v3.proxy_event_local_old on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.dos_event_local to tsg_galaxy_v3.dos_event_local_old on cluster ck_cluster;

-- 删除源表分布式表
DROP TABLE IF EXISTS tsg_galaxy_v3.session_record ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.session_record ON CLUSTER ck_cluster;
DROP TABLE IF EXISTS tsg_galaxy_v3.security_event ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.security_event ON CLUSTER ck_cluster;
DROP TABLE IF EXISTS tsg_galaxy_v3.transaction_record ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster;
DROP TABLE IF EXISTS tsg_galaxy_v3.voip_record ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.voip_record ON CLUSTER ck_cluster;
DROP TABLE IF EXISTS tsg_galaxy_v3.proxy_event ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster;
DROP TABLE IF EXISTS tsg_galaxy_v3.dos_event ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.dos_event ON CLUSTER ck_cluster;

-- assessment_event不用迁移
drop table IF EXISTS tsg_galaxy_v3.assessment_event on cluster ck_query;
drop table IF EXISTS tsg_galaxy_v3.assessment_event on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.assessment_event_local on cluster ck_cluster;

-- 删除废弃表
drop table IF EXISTS tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.gtpc_record on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.gtpc_record on cluster ck_query;

drop table IF EXISTS tsg_galaxy_v3.radius_onff_log_local on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.radius_onff_log on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.radius_onff_log on cluster ck_query;

drop table IF EXISTS tsg_galaxy_v3.radius_record_local on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.radius_record on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.radius_record on cluster ck_query;

drop table IF EXISTS tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query;

drop table IF EXISTS tsg_galaxy_v3.active_defence_event ON CLUSTER ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.active_defence_event ON CLUSTER ck_query;
drop table IF EXISTS tsg_galaxy_v3.active_defence_event_local ON CLUSTER ck_cluster;

-- 创建源码分布式表old
create table IF NOT EXISTS tsg_galaxy_v3.session_record_old ON CLUSTER ck_query (
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,session_record_local_old,rand());

create table IF NOT EXISTS tsg_galaxy_v3.security_event_old ON CLUSTER ck_query (
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,security_event_local_old,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.transaction_record_old ON CLUSTER ck_query(
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,transaction_record_local_old,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.voip_record_old ON CLUSTER ck_query(
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,voip_record_local_old,rand());

create table IF NOT EXISTS tsg_galaxy_v3.proxy_event_old ON CLUSTER ck_query (
    common_recv_time Int64,
    common_log_id UInt64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,proxy_event_local_old,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.dos_event_old ON CLUSTER ck_query(
    log_id UInt64,
    profile_id UInt64,
    start_time Int64
) ENGINE = Distributed(ck_cluster,tsg_galaxy_v3,dos_event_local_old,rand());


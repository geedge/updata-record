set distributed_ddl_task_timeout = 1800;

-- 删除源表同步到临时表物化视图, 七个表
drop view if exists tsg_galaxy_v3.session_record_local_2310_to_2401_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.security_event_local_2310_to_security_event_local_2401_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.security_event_local_2310_to_monitor_event_local_2401_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.transaction_record_local_2310_to_2401_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.voip_record_local_2310_to_2401_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.proxy_event_local_2310_to_2401_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.dos_event_local_2310_to_2401_view on cluster ck_cluster;

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

-- 删除临时表之间物化视图
drop VIEW IF EXISTS tsg_galaxy_v3.security_event_materialized_view_2401 ON CLUSTER ck_cluster;
drop VIEW IF EXISTS tsg_galaxy_v3.monitor_event_materialized_view_2401 ON CLUSTER ck_cluster;

-- 临时表rename到目标表
RENAME TABLE tsg_galaxy_v3.session_record_local_2401 to tsg_galaxy_v3.session_record_local on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.security_event_local_2401 to tsg_galaxy_v3.security_event_local on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.monitor_event_local_2401 to tsg_galaxy_v3.monitor_event_local on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.transaction_record_local_2401 to tsg_galaxy_v3.transaction_record_local on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.voip_record_local_2401 to tsg_galaxy_v3.voip_record_local on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.proxy_event_local_2401 to tsg_galaxy_v3.proxy_event_local on cluster ck_cluster;
RENAME TABLE tsg_galaxy_v3.dos_event_local_2401 to tsg_galaxy_v3.dos_event_local on cluster ck_cluster;

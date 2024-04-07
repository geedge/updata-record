set distributed_ddl_task_timeout = 180;

-- 删除旧表
drop table IF EXISTS tsg_galaxy_v3.session_record_local_old on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.security_event_local_old on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.transaction_record_local_old on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.voip_record_local_old on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.proxy_event_local_old on cluster ck_cluster;
drop table IF EXISTS tsg_galaxy_v3.dos_event_local_old on cluster ck_cluster;

-- 删除旧表分布式表
DROP TABLE IF EXISTS tsg_galaxy_v3.session_record_old ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.security_event_old ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.transaction_record_old ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.voip_record_old ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.proxy_event_old ON CLUSTER ck_query;
DROP TABLE IF EXISTS tsg_galaxy_v3.dos_event_old ON CLUSTER ck_query;

set distributed_ddl_task_timeout = 180;

-- 删除旧表同步新表物化视图, 七个表
drop view if exists tsg_galaxy_v3.session_record_local_2307_to_2402_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.security_event_local_2307_to_security_event_local_2402_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.security_event_local_2307_to_monitor_event_local_2402_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.transaction_record_local_2307_to_2402_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.voip_record_local_2307_to_2402_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.proxy_event_local_2307_to_2402_view on cluster ck_cluster;
drop view if exists tsg_galaxy_v3.dos_event_local_2307_to_2402_view on cluster ck_cluster;

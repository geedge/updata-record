ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region,MODIFY order by (common_log_id,common_policy_id,common_recv_time,common_namespace_id);
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region,MODIFY order by (common_log_id,common_policy_id,common_recv_time,common_namespace_id);
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_namespace_id  Int64 after common_user_region;
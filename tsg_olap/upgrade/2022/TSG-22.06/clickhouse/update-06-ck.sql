ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_app_identify_info  String after common_userdefine_app_name;


ALTER table tsg_galaxy_v3.session_record_common_client_ip_local ON CLUSTER ck_cluster MODIFY column IF EXISTS common_direction Nullable(Int64);
ALTER table tsg_galaxy_v3.session_record_common_client_ip ON CLUSTER ck_cluster MODIFY column IF EXISTS common_direction Nullable(Int64);
ALTER table tsg_galaxy_v3.session_record_common_client_ip ON CLUSTER ck_query MODIFY column IF EXISTS common_direction Nullable(Int64);

ALTER table tsg_galaxy_v3.session_record_common_server_ip_local ON CLUSTER ck_cluster MODIFY column IF EXISTS common_direction Nullable(Int64);
ALTER table tsg_galaxy_v3.session_record_common_server_ip ON CLUSTER ck_cluster MODIFY column IF EXISTS common_direction Nullable(Int64);
ALTER table tsg_galaxy_v3.session_record_common_server_ip ON CLUSTER ck_query MODIFY column IF EXISTS common_direction Nullable(Int64);

ALTER table tsg_galaxy_v3.session_record_http_domain_local ON CLUSTER ck_cluster MODIFY column IF EXISTS common_direction Nullable(Int64);
ALTER table tsg_galaxy_v3.session_record_http_domain ON CLUSTER ck_cluster MODIFY column IF EXISTS common_direction Nullable(Int64);
ALTER table tsg_galaxy_v3.session_record_http_domain ON CLUSTER ck_query MODIFY column IF EXISTS common_direction Nullable(Int64);
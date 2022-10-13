set distributed_ddl_task_timeout = 180;

ALTER table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_data_center,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_data_center,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_stream_trace_id,common_data_center,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_policy_id,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_policy_id,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_data_center,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_data_center,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_data_center,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type,MODIFY order by (common_log_id,common_policy_id,common_recv_time,common_vsys_id);
ALTER table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.session_record_common_client_ip_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record_common_client_ip on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record_common_client_ip on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.session_record_common_server_ip_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record_common_server_ip on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record_common_server_ip on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.session_record_http_domain_local on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record_http_domain on cluster ck_cluster add column IF NOT EXISTS common_vsys_id Int64 after common_schema_type;
ALTER table tsg_galaxy_v3.session_record_http_domain on cluster ck_query add column IF NOT EXISTS common_vsys_id  Int64 after common_schema_type;

ALTER table tsg_galaxy_v3.dos_event_local on cluster ck_cluster add column IF NOT EXISTS vsys_id Int64 after bit_rate,MODIFY order by (log_id,start_time,destination_ip,vsys_id);
ALTER table tsg_galaxy_v3.dos_event on cluster ck_cluster add column IF NOT EXISTS vsys_id Int64 after bit_rate;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_query add column IF NOT EXISTS vsys_id  Int64 after bit_rate;

ALTER table tsg_galaxy_v3.assessment_event_local on cluster ck_cluster add column IF NOT EXISTS vsys_id Int64 after file_checksum_sha,MODIFY order by (common_log_id,common_recv_time,vsys_id);
ALTER table tsg_galaxy_v3.assessment_event on cluster ck_cluster add column IF NOT EXISTS vsys_id Int64 after file_checksum_sha;
ALTER table tsg_galaxy_v3.assessment_event on cluster ck_query add column IF NOT EXISTS vsys_id Int64 after file_checksum_sha;

ALTER table tsg_galaxy_v3.radius_onff_log_local on cluster ck_cluster add column IF NOT EXISTS vsys_id Int64 after acct_session_time,MODIFY order by (account,event_timestamp,vsys_id);
ALTER table tsg_galaxy_v3.radius_onff_log on cluster ck_cluster add column IF NOT EXISTS vsys_id Int64 after acct_session_time;
ALTER table tsg_galaxy_v3.radius_onff_log on cluster ck_query add column IF NOT EXISTS vsys_id Int64 after acct_session_time;


ALTER table tsg_galaxy_v3.session_record_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1; 
ALTER table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.voip_record_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.radius_record_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.security_event_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster MODIFY column IF EXISTS common_vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.dos_event_local on cluster ck_cluster MODIFY column IF EXISTS vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.assessment_event_local on cluster ck_cluster MODIFY column IF EXISTS vsys_id Int64 default 1;
ALTER table tsg_galaxy_v3.radius_onff_log_local on cluster ck_cluster MODIFY column IF EXISTS vsys_id Int64 default 1;


drop view tsg_galaxy_v3.common_client_ip;
drop view tsg_galaxy_v3.common_http_domain;
drop view tsg_galaxy_v3.common_server_ip;

CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.common_client_ip ON CLUSTER ck_cluster TO tsg_galaxy_v3.session_record_common_client_ip_local AS SELECT common_log_id, common_recv_time, common_server_ip, common_client_ip, common_sled_ip, common_entrance_id, common_subscriber_id, common_stream_trace_id, http_domain, ssl_sni, common_schema_type, common_vsys_id, common_client_port, common_server_port, common_app_label, common_direction FROM tsg_galaxy_v3.session_record_local;
CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.common_http_domain ON CLUSTER ck_cluster TO tsg_galaxy_v3.session_record_http_domain_local AS SELECT common_log_id, common_recv_time, common_server_ip, common_client_ip, common_sled_ip, common_entrance_id, common_subscriber_id, common_stream_trace_id, http_domain, ssl_sni, common_schema_type, common_vsys_id, common_client_port, common_server_port, common_app_label, common_direction FROM tsg_galaxy_v3.session_record_local;
CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.common_server_ip ON CLUSTER ck_cluster TO tsg_galaxy_v3.session_record_common_server_ip_local AS SELECT common_log_id, common_recv_time, common_server_ip, common_client_ip, common_sled_ip, common_entrance_id, common_subscriber_id, common_stream_trace_id, http_domain, ssl_sni, common_schema_type, common_vsys_id, common_client_port, common_server_port, common_app_label, common_direction FROM tsg_galaxy_v3.session_record_local;
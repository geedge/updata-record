CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.voip_record_log_local on cluster ck_cluster(
	common_log_id UInt64,
	common_service Int64,
	common_recv_time Int64,
	common_direction Nullable(Int64),
	common_l4_protocol String,
	common_address_type Int64,
	common_schema_type String,
	common_policy_id Int64,
	common_user_tags String,
	common_action Int64,
	common_sub_action String,
	common_user_region String,
	common_client_ip String,
	common_client_port Int64,
	common_internal_ip String,
	common_entrance_id Int64,
	common_device_id String,
	common_link_id Int64,
	common_isp String,
	common_device_tag String,
	common_data_center String,
	common_encapsulation Int64,
	common_tunnels String,
	common_sled_ip String,
	common_client_location String,
	common_client_asn String,
	common_subscriber_id String,
	common_server_ip String,
	common_server_port Int64,
	common_external_ip String,
	common_server_location String,
	common_server_asn String,
	common_protocol_label String,
	common_app_label String,
	common_app_id Int64,
	common_app_surrogate_id Int64,
	common_l7_protocol String,
	common_sessions Int64,
	common_c2s_pkt_num Int64,
	common_s2c_pkt_num Int64,
	common_c2s_byte_num Int64,
	common_s2c_byte_num Int64,
	common_start_time Int64,
	common_end_time Int64,
	common_establish_latency_ms Int64,
	common_con_duration_ms Int64,
	common_stream_dir Int64,
	common_address_list String,
	common_has_dup_traffic Int64,
	common_stream_error String,
	common_stream_trace_id UInt64,
	common_link_info_c2s String,
	common_link_info_s2c String,
	common_c2s_ipfrag_num Int64,
	common_s2c_ipfrag_num Int64,
	common_c2s_tcp_lostlen Int64,
	common_s2c_tcp_lostlen Int64,
	common_c2s_tcp_unorder_num Int64,
	common_s2c_tcp_unorder_num Int64,
	common_tcp_client_isn Int64,
    common_tcp_server_isn Int64,
	common_first_ttl Int64,
	common_processing_time Int64,
	sip_call_id String,
	sip_originator_description String,
	sip_responder_description String,
	sip_user_agent String,
	sip_server String,
	sip_originator_sdp_connect_ip String,
	sip_originator_sdp_media_port Int64,
	sip_originator_sdp_media_type String,
	sip_originator_sdp_content String,
	sip_responder_sdp_connect_ip String,
	sip_responder_sdp_media_port Int64,
	sip_responder_sdp_media_type String,
	sip_responder_sdp_content String,
	sip_duration Int64,
	sip_bye String,
	rtp_payload_type_c2s Nullable(Int64),
	rtp_payload_type_s2c Nullable(Int64),
	rtp_pcap_path String,
	rtp_originator_dir Int64
)ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(common_recv_time)) ORDER BY (common_log_id,common_data_center,common_recv_time);

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.voip_record_log on cluster ck_query(
	common_log_id UInt64,
	common_service Int64,
	common_recv_time Int64,
	common_direction Nullable(Int64),
	common_l4_protocol String,
	common_address_type Int64,
	common_schema_type String,
	common_policy_id Int64,
	common_user_tags String,
	common_action Int64,
	common_sub_action String,
	common_user_region String,
	common_client_ip String,
	common_client_port Int64,
	common_internal_ip String,
	common_entrance_id Int64,
	common_device_id String,
	common_link_id Int64,
	common_isp String,
	common_device_tag String,
	common_data_center String,
	common_encapsulation Int64,
	common_tunnels String,
	common_sled_ip String,
	common_client_location String,
	common_client_asn String,
	common_subscriber_id String,
	common_server_ip String,
	common_server_port Int64,
	common_external_ip String,
	common_server_location String,
	common_server_asn String,
	common_protocol_label String,
	common_app_label String,
	common_app_id Int64,
	common_app_surrogate_id Int64,
	common_l7_protocol String,
	common_sessions Int64,
	common_c2s_pkt_num Int64,
	common_s2c_pkt_num Int64,
	common_c2s_byte_num Int64,
	common_s2c_byte_num Int64,
	common_start_time Int64,
	common_end_time Int64,
	common_establish_latency_ms Int64,
	common_con_duration_ms Int64,
	common_stream_dir Int64,
	common_address_list String,
	common_has_dup_traffic Int64,
	common_stream_error String,
	common_stream_trace_id UInt64,
	common_link_info_c2s String,
	common_link_info_s2c String,
	common_c2s_ipfrag_num Int64,
	common_s2c_ipfrag_num Int64,
	common_c2s_tcp_lostlen Int64,
	common_s2c_tcp_lostlen Int64,
	common_c2s_tcp_unorder_num Int64,
	common_s2c_tcp_unorder_num Int64,
	common_tcp_client_isn Int64,
    common_tcp_server_isn Int64,
	common_first_ttl Int64,
	common_processing_time Int64,
	sip_call_id String,
	sip_originator_description String,
	sip_responder_description String,
	sip_user_agent String,
	sip_server String,
	sip_originator_sdp_connect_ip String,
	sip_originator_sdp_media_port Int64,
	sip_originator_sdp_media_type String,
	sip_originator_sdp_content String,
	sip_responder_sdp_connect_ip String,
	sip_responder_sdp_media_port Int64,
	sip_responder_sdp_media_type String,
	sip_responder_sdp_content String,
	sip_duration Int64,
	sip_bye String,
	rtp_payload_type_c2s Nullable(Int64),
	rtp_payload_type_s2c Nullable(Int64),
	rtp_pcap_path String,
	rtp_originator_dir Int64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,voip_record_log_local,rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.voip_record_log on cluster ck_cluster(
	common_log_id UInt64,
	common_service Int64,
	common_recv_time Int64,
	common_direction Nullable(Int64),
	common_l4_protocol String,
	common_address_type Int64,
	common_schema_type String,
	common_policy_id Int64,
	common_user_tags String,
	common_action Int64,
	common_sub_action String,
	common_user_region String,
	common_client_ip String,
	common_client_port Int64,
	common_internal_ip String,
	common_entrance_id Int64,
	common_device_id String,
	common_link_id Int64,
	common_isp String,
	common_device_tag String,
	common_data_center String,
	common_encapsulation Int64,
	common_tunnels String,
	common_sled_ip String,
	common_client_location String,
	common_client_asn String,
	common_subscriber_id String,
	common_server_ip String,
	common_server_port Int64,
	common_external_ip String,
	common_server_location String,
	common_server_asn String,
	common_protocol_label String,
	common_app_label String,
	common_app_id Int64,
	common_app_surrogate_id Int64,
	common_l7_protocol String,
	common_sessions Int64,
	common_c2s_pkt_num Int64,
	common_s2c_pkt_num Int64,
	common_c2s_byte_num Int64,
	common_s2c_byte_num Int64,
	common_start_time Int64,
	common_end_time Int64,
	common_establish_latency_ms Int64,
	common_con_duration_ms Int64,
	common_stream_dir Int64,
	common_address_list String,
	common_has_dup_traffic Int64,
	common_stream_error String,
	common_stream_trace_id UInt64,
	common_link_info_c2s String,
	common_link_info_s2c String,
	common_c2s_ipfrag_num Int64,
	common_s2c_ipfrag_num Int64,
	common_c2s_tcp_lostlen Int64,
	common_s2c_tcp_lostlen Int64,
	common_c2s_tcp_unorder_num Int64,
	common_s2c_tcp_unorder_num Int64,
	common_tcp_client_isn Int64,
    common_tcp_server_isn Int64,
	common_first_ttl Int64,
	common_processing_time Int64,
	sip_call_id String,
	sip_originator_description String,
	sip_responder_description String,
	sip_user_agent String,
	sip_server String,
	sip_originator_sdp_connect_ip String,
	sip_originator_sdp_media_port Int64,
	sip_originator_sdp_media_type String,
	sip_originator_sdp_content String,
	sip_responder_sdp_connect_ip String,
	sip_responder_sdp_media_port Int64,
	sip_responder_sdp_media_type String,
	sip_responder_sdp_content String,
	sip_duration Int64,
	sip_bye String,
	rtp_payload_type_c2s Nullable(Int64),
	rtp_payload_type_s2c Nullable(Int64),
	rtp_pcap_path String,
	rtp_originator_dir Int64
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,voip_record_log_local,rand());




ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_call_id String after app_extra_info;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_call_id String after app_extra_info;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_description String after sip_call_id;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_description String after sip_call_id;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_description String after sip_originator_description;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_description String after sip_originator_description;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_user_agent String after sip_responder_description;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_user_agent String after sip_responder_description;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_server String after sip_user_agent;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_server String after sip_user_agent;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_connect_ip String after sip_server;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_connect_ip String after sip_server;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_port Int64 after sip_originator_sdp_connect_ip;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_port Int64 after sip_originator_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_type String after sip_originator_sdp_media_port;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_type String after sip_originator_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_content String after sip_originator_sdp_media_type;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_content String after sip_originator_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_connect_ip String after sip_originator_sdp_content;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_connect_ip String after sip_originator_sdp_content;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_port Int64 after sip_responder_sdp_connect_ip;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_port Int64 after sip_responder_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_type String after sip_responder_sdp_media_port;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_type String after sip_responder_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_content String after sip_responder_sdp_media_type;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_content String after sip_responder_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_duration Int64 after sip_responder_sdp_content;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_duration Int64 after sip_responder_sdp_content;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_bye String after sip_duration;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_bye String after sip_duration;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_c2s Nullable(Int64) after sip_duration;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_c2s Nullable(Int64) after sip_duration;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_s2c Nullable(Int64) after rtp_payload_type_c2s;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_s2c Nullable(Int64) after rtp_payload_type_c2s;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_pcap_path String after rtp_payload_type_s2c;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_pcap_path String after rtp_payload_type_s2c;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_originator_dir Int64 after rtp_pcap_path;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_originator_dir Int64 after rtp_pcap_path;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_call_id String after app_extra_info;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_description String after sip_call_id;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_description String after sip_originator_description;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_user_agent String after sip_responder_description;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_server String after sip_user_agent;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_connect_ip String after sip_server;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_port Int64 after sip_originator_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_type String after sip_originator_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_content String after sip_originator_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_connect_ip String after sip_originator_sdp_content;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_port Int64 after sip_responder_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_type String after sip_responder_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_content String after sip_responder_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_duration Int64 after sip_responder_sdp_content;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_bye String after sip_duration;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_payload_type_c2s Nullable(Int64) after sip_duration;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_payload_type_s2c Nullable(Int64) after rtp_payload_type_c2s;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_pcap_path String after rtp_payload_type_s2c;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_originator_dir Int64 after rtp_pcap_path;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_call_id String after app_extra_info;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_call_id String after app_extra_info;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_description String after sip_call_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_description String after sip_call_id;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_description String after sip_originator_description;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_description String after sip_originator_description;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_user_agent String after sip_responder_description;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_user_agent String after sip_responder_description;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_server String after sip_user_agent;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_server String after sip_user_agent;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_connect_ip String after sip_server;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_connect_ip String after sip_server;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_port Int64 after sip_originator_sdp_connect_ip;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_port Int64 after sip_originator_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_type String after sip_originator_sdp_media_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_type String after sip_originator_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_content String after sip_originator_sdp_media_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_originator_sdp_content String after sip_originator_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_connect_ip String after sip_originator_sdp_content;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_connect_ip String after sip_originator_sdp_content;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_port Int64 after sip_responder_sdp_connect_ip;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_port Int64 after sip_responder_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_type String after sip_responder_sdp_media_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_type String after sip_responder_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_content String after sip_responder_sdp_media_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_responder_sdp_content String after sip_responder_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_duration Int64 after sip_responder_sdp_content;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_duration Int64 after sip_responder_sdp_content;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_bye String after sip_duration;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS sip_bye String after sip_duration;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_c2s Nullable(Int64) after sip_duration;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_c2s Nullable(Int64) after sip_duration;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_s2c Nullable(Int64) after rtp_payload_type_c2s;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_payload_type_s2c Nullable(Int64) after rtp_payload_type_c2s;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_pcap_path String after rtp_payload_type_s2c;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_pcap_path String after rtp_payload_type_s2c;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_originator_dir Int64 after rtp_pcap_path;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS rtp_originator_dir Int64 after rtp_pcap_path;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_call_id String after app_extra_info;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_description String after sip_call_id;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_description String after sip_originator_description;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_user_agent String after sip_responder_description;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_server String after sip_user_agent;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_connect_ip String after sip_server;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_port Int64 after sip_originator_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_media_type String after sip_originator_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_originator_sdp_content String after sip_originator_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_connect_ip String after sip_originator_sdp_content;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_port Int64 after sip_responder_sdp_connect_ip;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_media_type String after sip_responder_sdp_media_port;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_responder_sdp_content String after sip_responder_sdp_media_type;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_duration Int64 after sip_responder_sdp_content;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS sip_bye String after sip_duration;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_payload_type_c2s Nullable(Int64) after sip_duration;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_payload_type_s2c Nullable(Int64) after rtp_payload_type_c2s;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_pcap_path String after rtp_payload_type_s2c;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS rtp_originator_dir Int64 after rtp_pcap_path;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content String after http_response_header;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content String after http_request_content;


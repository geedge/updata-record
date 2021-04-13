ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;


ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;



ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;


ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;



ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;



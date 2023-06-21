set distributed_ddl_task_timeout = 180;

ALTER table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash  String after ssl_ja3_hash;


ALTER table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint  String after ssl_ja3_hash;


ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_out_dst_mac  String after common_server_asn;



ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_in_dst_mac  String after common_server_asn;



ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_out_src_mac  String after common_phone_number;


ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_in_src_mac  String after common_phone_number;

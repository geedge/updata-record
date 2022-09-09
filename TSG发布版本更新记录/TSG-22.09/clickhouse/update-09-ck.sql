set distributed_ddl_task_timeout = 180;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cert_subject String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cert_subject  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_cert_subject  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cert_issuer String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cert_issuer  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_cert_issuer  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_hash String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_hash  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_ja3_hash  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_fingerprint String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_fingerprint  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_ja3_fingerprint  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_con_latency_ms Int64  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_con_latency_ms  Int64 after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_con_latency_ms  Int64 after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cn String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cn  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_cn  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_san String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_san  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_san  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_sni String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_sni  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_sni  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_version String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_version  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_version  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cookie String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cookie  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS dtls_cookie  String after ssl_cert_subject;


ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cert_subject String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cert_subject  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_cert_subject  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cert_issuer String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cert_issuer  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_cert_issuer  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_hash String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_hash  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_ja3_hash  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_fingerprint String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_fingerprint  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_ja3_fingerprint  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_con_latency_ms Int64  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_con_latency_ms  Int64 after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_con_latency_ms  Int64 after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cn String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cn  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_cn  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_san String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_san  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_san  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_sni String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_sni  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_sni  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_version String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_version  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_version  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS dtls_cookie String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS dtls_cookie  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS dtls_cookie  String after ssl_cert_subject;


ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_cert_subject String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_cert_subject  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_cert_subject  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_cert_issuer String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_cert_issuer  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_cert_issuer  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_hash String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_hash  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_ja3_hash  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_fingerprint String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_ja3_fingerprint  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_ja3_fingerprint  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_con_latency_ms Int64  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_con_latency_ms  Int64 after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_con_latency_ms  Int64 after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_cn String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_cn  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_cn  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_san String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_san  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_san  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_sni String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_sni  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_sni  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_version String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_version  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_version  String after ssl_cert_subject;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS dtls_cookie String  after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS dtls_cookie  String after ssl_cert_subject;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS dtls_cookie  String after ssl_cert_subject;



ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_b_desc  String after common_packet_capture_file;


ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.transaction_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.transaction_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.sys_packet_capture_event_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.sys_packet_capture_event on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.gtpc_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.gtpc_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

ALTER  table tsg_galaxy_v3.voip_record_local on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_cluster add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;
ALTER  table tsg_galaxy_v3.voip_record on cluster ck_query add column IF NOT EXISTS common_tunnel_endpoint_a_desc  String after common_packet_capture_file;

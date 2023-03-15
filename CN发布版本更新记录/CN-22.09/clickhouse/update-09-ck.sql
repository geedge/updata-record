ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_con_duration_ms  Int64 after common_end_time;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_con_duration_ms  Int64 after common_end_time;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_con_duration_ms  Int64 after common_end_time;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_app_id  String after common_app_label;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_app_id  String after common_app_label;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_app_id  String after common_app_label;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS client_zone  String after domain_whois_org;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS client_zone  String after domain_whois_org;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS client_zone  String after domain_whois_org;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS server_zone  String after client_idc_renter;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS server_zone  String after client_idc_renter;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS server_zone  String after client_idc_renter;


ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster 
MODIFY column IF EXISTS common_egress_link_id Nullable(Int64)
,MODIFY column IF EXISTS common_ingress_link_id Nullable(Int64)
,MODIFY column IF EXISTS http_status_code Nullable(Int64)
,MODIFY column IF EXISTS dns_qr Nullable(Int64)
,MODIFY column IF EXISTS dns_opcode Nullable(Int64)
,MODIFY column IF EXISTS dns_aa Nullable(Int64)
,MODIFY column IF EXISTS dns_rcode Nullable(Int64)
,MODIFY column IF EXISTS dns_qtype Nullable(Int64)
,MODIFY column IF EXISTS dns_qclass Nullable(Int64)
,MODIFY column IF EXISTS dns_sub Nullable(Int64)
,MODIFY column IF EXISTS domain_reputation_score Nullable(Int64)
,MODIFY column IF EXISTS client_longitude Nullable(Float64)
,MODIFY column IF EXISTS client_latitude Nullable(Float64)
,MODIFY column IF EXISTS server_longitude Nullable(Float64)
,MODIFY column IF EXISTS server_latitude Nullable(Float64)
,MODIFY column IF EXISTS app_is_protocol Nullable(Int64)
,MODIFY column IF EXISTS app_risk Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_tcp_lostlen Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_tcp_lostlen Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_tcp_unorder_num Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_tcp_unorder_num Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_byte_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_byte_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_pkt_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_pkt_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_establish_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS http_response_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS ssl_con_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS dns_response_latency_ms Nullable(Int64);

ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster 
MODIFY column IF EXISTS common_egress_link_id Nullable(Int64)
,MODIFY column IF EXISTS common_ingress_link_id Nullable(Int64)
,MODIFY column IF EXISTS http_status_code Nullable(Int64)
,MODIFY column IF EXISTS dns_qr Nullable(Int64)
,MODIFY column IF EXISTS dns_opcode Nullable(Int64)
,MODIFY column IF EXISTS dns_aa Nullable(Int64)
,MODIFY column IF EXISTS dns_rcode Nullable(Int64)
,MODIFY column IF EXISTS dns_qtype Nullable(Int64)
,MODIFY column IF EXISTS dns_qclass Nullable(Int64)
,MODIFY column IF EXISTS dns_sub Nullable(Int64)
,MODIFY column IF EXISTS domain_reputation_score Nullable(Int64)
,MODIFY column IF EXISTS client_longitude Nullable(Float64)
,MODIFY column IF EXISTS client_latitude Nullable(Float64)
,MODIFY column IF EXISTS server_longitude Nullable(Float64)
,MODIFY column IF EXISTS server_latitude Nullable(Float64)
,MODIFY column IF EXISTS app_is_protocol Nullable(Int64)
,MODIFY column IF EXISTS app_risk Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_tcp_lostlen Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_tcp_lostlen Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_tcp_unorder_num Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_tcp_unorder_num Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_byte_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_byte_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_pkt_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_pkt_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_establish_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS http_response_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS ssl_con_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS dns_response_latency_ms Nullable(Int64);

ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query 
MODIFY column IF EXISTS common_egress_link_id Nullable(Int64)
,MODIFY column IF EXISTS common_ingress_link_id Nullable(Int64)
,MODIFY column IF EXISTS http_status_code Nullable(Int64)
,MODIFY column IF EXISTS dns_qr Nullable(Int64)
,MODIFY column IF EXISTS dns_opcode Nullable(Int64)
,MODIFY column IF EXISTS dns_aa Nullable(Int64)
,MODIFY column IF EXISTS dns_rcode Nullable(Int64)
,MODIFY column IF EXISTS dns_qtype Nullable(Int64)
,MODIFY column IF EXISTS dns_qclass Nullable(Int64)
,MODIFY column IF EXISTS dns_sub Nullable(Int64)
,MODIFY column IF EXISTS domain_reputation_score Nullable(Int64)
,MODIFY column IF EXISTS client_longitude Nullable(Float64)
,MODIFY column IF EXISTS client_latitude Nullable(Float64)
,MODIFY column IF EXISTS server_longitude Nullable(Float64)
,MODIFY column IF EXISTS server_latitude Nullable(Float64)
,MODIFY column IF EXISTS app_is_protocol Nullable(Int64)
,MODIFY column IF EXISTS app_risk Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_tcp_lostlen Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_tcp_lostlen Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_tcp_unorder_num Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_tcp_unorder_num Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_byte_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_byte_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_c2s_pkt_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_s2c_pkt_retrans Nullable(Int64)
,MODIFY column IF EXISTS common_establish_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS http_response_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS ssl_con_latency_ms Nullable(Int64)
,MODIFY column IF EXISTS dns_response_latency_ms Nullable(Int64);


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ip_local ON CLUSTER ck_cluster (
 ip String,
 side String,
 zone String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,ip) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ip ON CLUSTER ck_cluster (
 ip String,
 side String,
 zone String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_ip_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ip ON CLUSTER ck_query (
 ip String,
 side String,
 zone String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_ip_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_region_local ON CLUSTER ck_cluster (
 country String,
 province String,
 city String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,country,province,city) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_region ON CLUSTER ck_cluster (
 country String,
 province String,
 city String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_region_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_region ON CLUSTER ck_query (
 country String,
 province String,
 city String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_region_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_asn_local ON CLUSTER ck_cluster (
 asn String,
 isp String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,asn,isp) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_asn ON CLUSTER ck_cluster (
 asn String,
 isp String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_asn_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_asn ON CLUSTER ck_query (
 asn String,
 isp String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_asn_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_idc_renter_local ON CLUSTER ck_cluster (
 idc_renter String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,idc_renter) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_idc_renter ON CLUSTER ck_cluster (
 idc_renter String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_idc_renter_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_idc_renter ON CLUSTER ck_query (
 idc_renter String,
 side String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_idc_renter_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_application_local ON CLUSTER ck_cluster (
 common_app_label String,
 app_category String,
 app_subcategory String,
 app_company String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,common_app_label,app_category,app_subcategory,app_company) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_application ON CLUSTER ck_cluster (
 common_app_label String,
 app_category String,
 app_subcategory String,
 app_company String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_application_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_application ON CLUSTER ck_query (
 common_app_label String,
 app_category String,
 app_subcategory String,
 app_company String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_application_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_domain_local ON CLUSTER ck_cluster (
 domain String,
 domain_category_name String,
 domain_category_group String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,domain,domain_category_name,domain_category_group) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_domain ON CLUSTER ck_cluster (
 domain String,
 domain_category_name String,
 domain_category_group String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_domain_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_domain ON CLUSTER ck_query (
 domain String,
 domain_category_name String,
 domain_category_group String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_domain_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_http_host_local ON CLUSTER ck_cluster (
 http_host String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,http_host) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_http_host ON CLUSTER ck_cluster (
 http_host String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_http_host_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_http_host ON CLUSTER ck_query (
 http_host String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_http_host_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ssl_sni_local ON CLUSTER ck_cluster (
 ssl_sni String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,ssl_sni) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ssl_sni ON CLUSTER ck_cluster (
 ssl_sni String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_ssl_sni_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ssl_sni ON CLUSTER ck_query (
 ssl_sni String,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_ssl_sni_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_protocol_local ON CLUSTER ck_cluster (
 common_l7_protocol  String,
 common_server_port Int64,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,common_l7_protocol,common_server_port) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_protocol ON CLUSTER ck_cluster (
 common_l7_protocol  String,
 common_server_port Int64,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_protocol_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_protocol ON CLUSTER ck_query (
 common_l7_protocol  String,
 common_server_port Int64,
 stat_time Int64,
 common_c2s_pkt_num Int64,
 common_c2s_byte_num Int64,
 common_s2c_pkt_num Int64,
 common_s2c_byte_num Int64,
 common_sessions Int64,
 traffic_inbound_byte Int64,
 traffic_inbound_pkt Int64,
 traffic_outbound_byte Int64,
 traffic_outbound_pkt Int64,
 traffic_internal_byte Int64,
 traffic_internal_pkt Int64,
 traffic_through_byte Int64,
 traffic_through_pkt Int64,
 c2s_tcp_lostlen_ratio Nullable(Float64),
 s2c_tcp_lostlen_ratio Nullable(Float64),
 tcp_lostlen_ratio Nullable(Float64),
 c2s_tcp_unorder_num_ratio Nullable(Float64),
 s2c_tcp_unorder_num_ratio Nullable(Float64),
 tcp_unorder_num_ratio Nullable(Float64),
 c2s_byte_retrans_ratio Nullable(Float64),
 s2c_byte_retrans_ratio Nullable(Float64),
 byte_retrans_ratio Nullable(Float64),
 c2s_pkt_retrans_ratio Nullable(Float64),
 s2c_pkt_retrans_ratio Nullable(Float64),
 pkt_retrans_ratio Nullable(Float64),
 avg_establish_latency_ms Nullable(Float64),
 avg_http_response_latency_ms Nullable(Float64),
 avg_ssl_con_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_protocol_local', rand());
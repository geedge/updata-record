CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_link_local ON CLUSTER ck_cluster (
 client_country  String,
 client_province String,
 client_region String,
 server_country String,
 server_province String,
 server_region String,
 common_egress_link_id Int64,
 common_ingress_link_id Int64,
 egress_link_direction String,
 ingress_link_direction String,
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
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_link ON CLUSTER ck_cluster (
 client_country  String,
 client_province String,
 client_region String,
 server_country String,
 server_province String,
 server_region String,
 common_egress_link_id Int64,
 common_ingress_link_id Int64,
 egress_link_direction String,
 ingress_link_direction String,
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
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_link_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_link ON CLUSTER ck_query (
 client_country  String,
 client_province String,
 client_region String,
 server_country String,
 server_province String,
 server_region String,
 common_egress_link_id Int64,
 common_ingress_link_id Int64,
 egress_link_direction String,
 ingress_link_direction String,
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
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_link_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_server_ip_local ON CLUSTER ck_cluster (
 server_ip String,
 server_country String,
 server_city String,
 server_isp String,
 server_org String,
 server_role Array(String),
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,server_ip) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_server_ip ON CLUSTER ck_cluster (
 server_ip String,
 server_country String,
 server_city String,
 server_isp String,
 server_org String,
 server_role Array(String),
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_server_ip_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_server_ip ON CLUSTER ck_query (
 server_ip String,
 server_country String,
 server_city String,
 server_isp String,
 server_org String,
 server_role Array(String),
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_server_ip_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_qname_local ON CLUSTER ck_cluster (
 qname String,
 qname_sld String,
 qname_tld String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,qname) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_qname ON CLUSTER ck_cluster (
 qname String,
 qname_sld String,
 qname_tld String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_qname_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_qname ON CLUSTER ck_query (
 qname String,
 qname_sld String,
 qname_tld String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_qname_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_qtype_local ON CLUSTER ck_cluster (
 qtype Int64,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,qtype) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_qtype ON CLUSTER ck_cluster (
 qtype Int64,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_qtype_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_qtype ON CLUSTER ck_query (
 qtype Int64,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_qtype_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rcode_local ON CLUSTER ck_cluster (
 rcode Int64,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,rcode) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rcode ON CLUSTER ck_cluster (
 rcode Int64,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rcode_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rcode ON CLUSTER ck_query (
 rcode Int64,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rcode_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_a_local ON CLUSTER ck_cluster (
 rr_a String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,rr_a) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_a ON CLUSTER ck_cluster (
 rr_a String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rr_a_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_a ON CLUSTER ck_query (
 rr_a String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rr_a_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_aaaa_local ON CLUSTER ck_cluster (
 rr_aaaa String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,rr_aaaa) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_aaaa ON CLUSTER ck_cluster (
 rr_aaaa String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rr_aaaa_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_aaaa ON CLUSTER ck_query (
 rr_aaaa String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rr_aaaa_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_cname_local ON CLUSTER ck_cluster (
 rr_cname String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,rr_cname) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_cname ON CLUSTER ck_cluster (
 rr_cname String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rr_cname_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_dns_rr_cname ON CLUSTER ck_query (
 rr_cname String,
 stat_time Int64,
 query_num Int64,
 traffic_inbound_byte Int64,
 traffic_outbound_byte Int64,
 internal_query_num Int64,
 external_query_num Int64,
 avg_response_latency_ms Nullable(Float64)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_dns_rr_cname_local', rand());
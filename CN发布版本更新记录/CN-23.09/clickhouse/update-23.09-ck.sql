set distributed_ddl_task_timeout = 180;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_flags  UInt64 after common_recv_time , add column IF NOT EXISTS common_log_id  UInt64 after common_recv_time , add column IF NOT EXISTS common_app_full_path  String after common_app_label  , add column IF NOT EXISTS domain_sld  String after domain;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_flags  UInt64 after common_recv_time ,add column IF NOT EXISTS common_log_id  UInt64 after common_recv_time , add column IF NOT EXISTS common_app_full_path  String after common_app_label  , add column IF NOT EXISTS domain_sld  String after domain;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_flags  UInt64 after common_recv_time ,add column IF NOT EXISTS common_log_id  UInt64 after common_recv_time , add column IF NOT EXISTS common_app_full_path  String after common_app_label , add column IF NOT EXISTS domain_sld  String after domain;


ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster  drop column IF EXISTS common_direction ,drop column IF EXISTS common_stream_dir  ,drop column IF EXISTS common_server_fqdn  ,drop column IF EXISTS common_app_id  ,drop column IF EXISTS common_isp  ,drop column IF EXISTS ssl_ja3_fingerprint  ,drop column IF EXISTS ssl_ja3s_fingerprint  ,drop column IF EXISTS domain_reputation_score  ,drop column IF EXISTS http_host_tags  ,drop column IF EXISTS ssl_sni_tags  ,drop column IF EXISTS client_whois_owner  ,drop column IF EXISTS client_idc_renter  ,drop column IF EXISTS server_whois_owner  ,drop column IF EXISTS server_idc_renter  ,drop column IF EXISTS app_is_protocol  ,drop column IF EXISTS app_risk  ,drop column IF EXISTS dns_server_role  ,drop column IF EXISTS dns_server_org  ,drop column IF EXISTS dns_server_os  ,drop column IF EXISTS dns_server_software	  ,drop column IF EXISTS dns_protocol;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster drop column IF EXISTS common_direction ,drop column IF EXISTS common_stream_dir  ,drop column IF EXISTS common_server_fqdn  ,drop column IF EXISTS common_app_id  ,drop column IF EXISTS common_isp  ,drop column IF EXISTS ssl_ja3_fingerprint  ,drop column IF EXISTS ssl_ja3s_fingerprint  ,drop column IF EXISTS domain_reputation_score  ,drop column IF EXISTS http_host_tags  ,drop column IF EXISTS ssl_sni_tags  ,drop column IF EXISTS client_whois_owner  ,drop column IF EXISTS client_idc_renter  ,drop column IF EXISTS server_whois_owner  ,drop column IF EXISTS server_idc_renter  ,drop column IF EXISTS app_is_protocol  ,drop column IF EXISTS app_risk  ,drop column IF EXISTS dns_server_role  ,drop column IF EXISTS dns_server_org  ,drop column IF EXISTS dns_server_os  ,drop column IF EXISTS dns_server_software	  ,drop column IF EXISTS dns_protocol;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query drop column IF EXISTS common_direction ,drop column IF EXISTS common_stream_dir  ,drop column IF EXISTS common_server_fqdn  ,drop column IF EXISTS common_app_id  ,drop column IF EXISTS common_isp  ,drop column IF EXISTS ssl_ja3_fingerprint  ,drop column IF EXISTS ssl_ja3s_fingerprint  ,drop column IF EXISTS domain_reputation_score  ,drop column IF EXISTS http_host_tags  ,drop column IF EXISTS ssl_sni_tags  ,drop column IF EXISTS client_whois_owner  ,drop column IF EXISTS client_idc_renter  ,drop column IF EXISTS server_whois_owner  ,drop column IF EXISTS server_idc_renter  ,drop column IF EXISTS app_is_protocol  ,drop column IF EXISTS app_risk  ,drop column IF EXISTS dns_server_role  ,drop column IF EXISTS dns_server_org  ,drop column IF EXISTS dns_server_os  ,drop column IF EXISTS dns_server_software	  ,drop column IF EXISTS dns_protocol;


ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster rename column IF EXISTS common_ingress_link_id TO common_in_link_id ,rename column IF EXISTS common_egress_link_id TO common_out_link_id ,rename column IF EXISTS egress_link_direction TO out_link_direction ,rename column IF EXISTS ingress_link_direction TO in_link_direction ,rename column IF EXISTS client_country TO client_country_region ,rename column IF EXISTS client_province TO client_super_admin_area ,rename column IF EXISTS client_region TO client_admin_area ,rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_province TO server_super_admin_area ,rename column IF EXISTS server_region TO server_admin_area;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster rename column IF EXISTS common_ingress_link_id TO common_in_link_id ,rename column IF EXISTS common_egress_link_id TO common_out_link_id ,rename column IF EXISTS egress_link_direction TO out_link_direction ,rename column IF EXISTS ingress_link_direction TO in_link_direction ,rename column IF EXISTS client_country TO client_country_region ,rename column IF EXISTS client_province TO client_super_admin_area ,rename column IF EXISTS client_region TO client_admin_area ,rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_province TO server_super_admin_area ,rename column IF EXISTS server_region TO server_admin_area;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query rename column IF EXISTS common_ingress_link_id TO common_in_link_id ,rename column IF EXISTS common_egress_link_id TO common_out_link_id ,rename column IF EXISTS egress_link_direction TO out_link_direction ,rename column IF EXISTS ingress_link_direction TO in_link_direction ,rename column IF EXISTS client_country TO client_country_region ,rename column IF EXISTS client_province TO client_super_admin_area ,rename column IF EXISTS client_region TO client_admin_area ,rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_province TO server_super_admin_area ,rename column IF EXISTS server_region TO server_admin_area;


ALTER  table cyber_narrator_galaxy.metric_link_local on cluster ck_cluster rename column IF EXISTS client_country TO client_country_region ,rename column IF EXISTS client_province TO client_super_admin_area ,rename column IF EXISTS client_region TO client_admin_area ,rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_province TO server_super_admin_area ,rename column IF EXISTS server_region TO server_admin_area ,rename column IF EXISTS common_ingress_link_id TO common_in_link_id ,rename column IF EXISTS common_egress_link_id TO common_out_link_id ,rename column IF EXISTS egress_link_direction TO out_link_direction ,rename column IF EXISTS ingress_link_direction TO in_link_direction ;
ALTER  table cyber_narrator_galaxy.metric_link on cluster ck_cluster rename column IF EXISTS client_country TO client_country_region ,rename column IF EXISTS client_province TO client_super_admin_area ,rename column IF EXISTS client_region TO client_admin_area ,rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_province TO server_super_admin_area ,rename column IF EXISTS server_region TO server_admin_area ,rename column IF EXISTS common_ingress_link_id TO common_in_link_id ,rename column IF EXISTS common_egress_link_id TO common_out_link_id ,rename column IF EXISTS egress_link_direction TO out_link_direction ,rename column IF EXISTS ingress_link_direction TO in_link_direction ;
ALTER  table cyber_narrator_galaxy.metric_link on cluster ck_query rename column IF EXISTS client_country TO client_country_region ,rename column IF EXISTS client_province TO client_super_admin_area ,rename column IF EXISTS client_region TO client_admin_area ,rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_province TO server_super_admin_area ,rename column IF EXISTS server_region TO server_admin_area ,rename column IF EXISTS common_ingress_link_id TO common_in_link_id ,rename column IF EXISTS common_egress_link_id TO common_out_link_id ,rename column IF EXISTS egress_link_direction TO out_link_direction ,rename column IF EXISTS ingress_link_direction TO in_link_direction ;


ALTER  table cyber_narrator_galaxy.metric_dns_server_ip_local on cluster ck_cluster add column IF NOT EXISTS server_super_admin_area String AFTER server_country;
ALTER  table cyber_narrator_galaxy.metric_dns_server_ip on cluster ck_cluster  add column IF NOT EXISTS server_super_admin_area String AFTER server_country;
ALTER  table cyber_narrator_galaxy.metric_dns_server_ip on cluster ck_query  add column IF NOT EXISTS server_super_admin_area String AFTER server_country;

ALTER  table cyber_narrator_galaxy.metric_dns_server_ip_local on cluster ck_cluster rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_city TO server_admin_area;
ALTER  table cyber_narrator_galaxy.metric_dns_server_ip on cluster ck_cluster rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_city TO server_admin_area;
ALTER  table cyber_narrator_galaxy.metric_dns_server_ip on cluster ck_query rename column IF EXISTS server_country TO server_country_region ,rename column IF EXISTS server_city TO server_admin_area;

ALTER  table cyber_narrator_galaxy.metric_dns_server_ip_local on cluster ck_cluster drop column IF EXISTS server_org;
ALTER  table cyber_narrator_galaxy.metric_dns_server_ip on cluster ck_cluster  drop column IF EXISTS server_org;
ALTER  table cyber_narrator_galaxy.metric_dns_server_ip on cluster ck_query  drop column IF EXISTS server_org;


ALTER  table cyber_narrator_galaxy.metric_domain_local on cluster ck_cluster add column IF NOT EXISTS domain_sld  String after domain;
ALTER  table cyber_narrator_galaxy.metric_domain on cluster ck_cluster add column IF NOT EXISTS domain_sld  String after domain;
ALTER  table cyber_narrator_galaxy.metric_domain on cluster ck_query add column IF NOT EXISTS domain_sld  String after domain;


drop table IF EXISTS cyber_narrator_galaxy.metric_idc_renter_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_idc_renter on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_idc_renter on cluster ck_query;

drop table IF EXISTS cyber_narrator_galaxy.metric_ssl_sni_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_ssl_sni on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_ssl_sni on cluster ck_query;

drop table IF EXISTS cyber_narrator_galaxy.metric_http_host_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_http_host on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_http_host on cluster ck_query;


drop table IF EXISTS cyber_narrator_galaxy.metric_region_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_region on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_region on cluster ck_query;


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_region_local ON CLUSTER ck_cluster (
 country_region String,
 super_admin_area String,
 admin_area String,
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
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,country_region,super_admin_area,admin_area) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_region ON CLUSTER ck_cluster (
 country_region String,
 super_admin_area String,
 admin_area String,
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
 country_region String,
 super_admin_area String,
 admin_area String,
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

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_relation_local ON CLUSTER ck_cluster (
 app_name String,
 domain String,
 ip String,
 ip_country_region String,
 ip_super_admin_area String,
 ip_admin_area String,
 ip_asn String,
 ip_isp String,
 domain_category_name String,
 domain_category_group String,
 app_category String,
 app_subcategory String,
 entity_tags Array(String),
 stat_time Int64
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_relation ON CLUSTER ck_cluster (
 app_name String,
 domain String,
 ip String,
 ip_country_region String,
 ip_super_admin_area String,
 ip_admin_area String,
 ip_asn String,
 ip_isp String,
 domain_category_name String,
 domain_category_group String,
 app_category String,
 app_subcategory String,
 entity_tags Array(String),
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_relation_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_relation ON CLUSTER ck_query (
 app_name String,
 domain String,
 ip String,
 ip_country_region String,
 ip_super_admin_area String,
 ip_admin_area String,
 ip_asn String,
 ip_isp String,
 domain_category_name String,
 domain_category_group String,
 app_category String,
 app_subcategory String,
 entity_tags Array(String),
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_relation_local', rand());



CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ip_dynamic_attribute_local ON CLUSTER ck_cluster (
 ip String,
 l7_protocol String,
 port Int64,
 stat_time Int64
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ip_dynamic_attribute ON CLUSTER ck_cluster (
 ip String,
 l7_protocol String,
 port Int64,
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_ip_dynamic_attribute_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_ip_dynamic_attribute ON CLUSTER ck_query (
 ip String,
 l7_protocol String,
 port Int64,
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_ip_dynamic_attribute_local', rand());




drop table IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation on cluster ck_query;

drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_query;

drop view IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation_view on cluster ck_cluster;
drop view IF EXISTS cyber_narrator_galaxy.cn_entity_relation_view on cluster ck_cluster;


set distributed_ddl_task_timeout = 180;

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


drop table IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation on cluster ck_query;

drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation_local on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_query;

drop view IF EXISTS cyber_narrator_galaxy.cn_dynamic_info_relation_view on cluster ck_cluster;
drop view IF EXISTS cyber_narrator_galaxy.cn_entity_relation_view on cluster ck_cluster;



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



CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_entity_relation_local on cluster ck_cluster
(

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
    create_time Int64,
    update_time Int64
)
ENGINE = MergeTree
ORDER BY (ip,
 domain,
 app_name)
TTL toDateTime(update_time) + toIntervalSecond(2592000),
 toDateTime(update_time) + toIntervalSecond(1) GROUP BY ip,
 domain,
 app_name SET create_time = min(create_time),
 update_time = max(update_time),
 ip_country_region = anyLast(ip_country_region),
 ip_super_admin_area = anyLast(ip_super_admin_area),
 ip_admin_area = anyLast(ip_admin_area),
 ip_asn = anyLast(ip_asn),
 ip_isp = anyLast(ip_isp),
 domain_category_name = anyLast(domain_category_name),
 domain_category_group = anyLast(domain_category_group),
 app_category = anyLast(app_category),
 app_subcategory = anyLast(app_subcategory), 
 entity_tags = groupUniqArrayArray(entity_tags);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_query
(

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
    create_time Int64,
    update_time Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_entity_relation_local',
 rand());

 CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_cluster
(

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
    create_time Int64,
    update_time Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_entity_relation_local',
 rand());


  CREATE MATERIALIZED VIEW  if not exists cyber_narrator_galaxy.cn_entity_relation_view  on cluster ck_cluster TO cyber_narrator_galaxy.cn_entity_relation_local
(

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
    create_time Int64,
    update_time Int64
) AS
SELECT
    common_app_label AS app_name,
    domain AS domain,
    common_server_ip AS ip,
    anyLast(server_country_region) AS ip_country_region,
    anyLast(server_super_admin_area) AS ip_super_admin_area,
    anyLast(server_admin_area) AS ip_admin_area,
    anyLast(server_asn) AS ip_asn,
    anyLast(server_isp) AS ip_isp,
    anyLast(domain_category_name) AS domain_category_name,
    anyLast(domain_category_group) AS domain_category_group,
    anyLast(app_category) AS app_category,
    anyLast(app_subcategory) AS app_subcategory,
    groupUniqArrayArray(arrayConcat(server_ip_tags,domain_tags,app_tags)) AS entity_tags,
    min(c1.common_recv_time) AS create_time,
    max(c1.common_recv_time) AS update_time
FROM cyber_narrator_galaxy.session_record_cn_local AS c1
WHERE (common_l4_protocol = 'IPv4_TCP') OR (common_server_port IN (53,
 443))
GROUP BY
    ip,
    app_name,
    domain;
   
  CREATE MATERIALIZED VIEW  if not exists  cyber_narrator_galaxy.cn_entity_relation_view_metric on cluster ck_cluster TO cyber_narrator_galaxy.cn_entity_relation_local
(

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
    create_time Int64,
    update_time Int64
) AS
SELECT
    app_name AS app_name,
    domain AS domain,
    ip AS ip,
    anyLast(ip_country_region) AS ip_country_region,
    anyLast(ip_super_admin_area) AS ip_super_admin_area,
    anyLast(ip_admin_area) AS ip_admin_area,
    anyLast(ip_asn) AS ip_asn,
    anyLast(ip_isp) AS ip_isp,
    anyLast(domain_category_name) AS domain_category_name,
    anyLast(domain_category_group) AS domain_category_group,
    anyLast(app_category) AS app_category,
    anyLast(app_subcategory) AS app_subcategory,
    groupUniqArrayArray(entity_tags) AS entity_tags,
    min(c1.stat_time) AS create_time,
    max(c1.stat_time) AS update_time
FROM cyber_narrator_galaxy.metric_relation_local AS c1
GROUP BY
    ip,
    app_name,
    domain;   
 

 CREATE TABLE if not exists cyber_narrator_galaxy.cn_ip_dynamic_attribute_local on cluster ck_cluster
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
)
ENGINE = MergeTree
ORDER BY (ip,
 port,
 l7_protocol)
TTL toDateTime(update_time) + toIntervalSecond(2592000),
 toDateTime(update_time) + toIntervalSecond(1) GROUP BY ip,
 port,
 l7_protocol SET create_time = min(create_time),
 update_time = max(update_time);
 
 CREATE TABLE if not exists cyber_narrator_galaxy.cn_ip_dynamic_attribute on cluster ck_query
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_ip_dynamic_attribute_local',
 rand());

 CREATE TABLE if not exists cyber_narrator_galaxy.cn_ip_dynamic_attribute on cluster ck_cluster
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_ip_dynamic_attribute_local',
 rand());


 CREATE MATERIALIZED VIEW if not exists cyber_narrator_galaxy.cn_ip_dynamic_attribute_view on cluster ck_cluster TO cyber_narrator_galaxy.cn_ip_dynamic_attribute_local
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
) AS
SELECT
    common_server_ip AS ip,
    common_l7_protocol AS l7_protocol,
    common_server_port AS port,
    min(c1.common_recv_time) AS create_time,
    max(c1.common_recv_time) AS update_time
FROM cyber_narrator_galaxy.session_record_cn_local AS c1
WHERE (common_l4_protocol = 'IPv4_TCP') OR (common_server_port IN (53,
 443))
GROUP BY
    ip,
    l7_protocol,
    port;

 CREATE MATERIALIZED VIEW if not exists cyber_narrator_galaxy.cn_ip_dynamic_attribute_view_metric on cluster ck_cluster TO cyber_narrator_galaxy.cn_ip_dynamic_attribute_local
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
) AS
SELECT
    ip AS ip,
    l7_protocol AS l7_protocol,
    port AS port,
    min(c1.stat_time) AS create_time,
    max(c1.stat_time) AS update_time
FROM cyber_narrator_galaxy.metric_ip_dynamic_attribute_local AS c1
GROUP BY
    ip,
    l7_protocol,
    port;
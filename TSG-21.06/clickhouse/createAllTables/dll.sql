CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.active_defence_event_log_local on cluster ck_cluster(
common_log_id UInt64,
common_recv_time Int64,
common_entrance_id Int64,
common_device_id String,
common_link_id Int64,
common_policy_id Int64,
common_user_region String,
ad_method String,
ad_protocol String,
common_address_type Int64,
ad_target_ip String,
ad_target_port String,
ad_cc_target_url String,
ad_target_ip_location String,
ad_target_ip_asn String,
ad_claimed_src_ip_profile_id Int64,
ad_reflector_profile_id Int64,
ad_sent_pkt_num Int64,
ad_sent_byte_num Int64,
ad_cc_initiate_connection_num Int64,
ad_cc_established_connection_num Int64,
ad_cc_rejected_connection_num Int64,
ad_generate_time Int64
)
ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(common_recv_time)) ORDER BY (common_log_id,common_policy_id,common_recv_time);

create table IF NOT EXISTS tsg_galaxy_v3.active_defence_event_log on cluster ck_query(
common_log_id UInt64,
common_recv_time Int64,
common_entrance_id Int64,
common_device_id String,
common_link_id Int64,
common_policy_id Int64,
common_user_region String,
ad_method String,
ad_protocol String,
common_address_type Int64,
ad_target_ip String,
ad_target_port String,
ad_cc_target_url String,
ad_target_ip_location String,
ad_target_ip_asn String,
ad_claimed_src_ip_profile_id Int64,
ad_reflector_profile_id Int64,
ad_sent_pkt_num Int64,
ad_sent_byte_num Int64,
ad_cc_initiate_connection_num Int64,
ad_cc_established_connection_num Int64,
ad_cc_rejected_connection_num Int64,
ad_generate_time Int64
)
ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,active_defence_event_log_local,rand());

create table IF NOT EXISTS tsg_galaxy_v3.active_defence_event_log on cluster ck_cluster(
common_log_id UInt64,
common_recv_time Int64,
common_entrance_id Int64,
common_device_id String,
common_link_id Int64,
common_policy_id Int64,
common_user_region String,
ad_method String,
ad_protocol String,
common_address_type Int64,
ad_target_ip String,
ad_target_port String,
ad_cc_target_url String,
ad_target_ip_location String,
ad_target_ip_asn String,
ad_claimed_src_ip_profile_id Int64,
ad_reflector_profile_id Int64,
ad_sent_pkt_num Int64,
ad_sent_byte_num Int64,
ad_cc_initiate_connection_num Int64,
ad_cc_established_connection_num Int64,
ad_cc_rejected_connection_num Int64,
ad_generate_time Int64
)
ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,active_defence_event_log_local,rand());



CREATE DICTIONARY IF NOT EXISTS cdn on cluster ck_cluster (
cdn_id UInt64,
 domain String,
 cname String) PRIMARY KEY cdn_id SOURCE(MYSQL(PORT 3306 USER 'root' PASSWORD 'bifang!@#' REPLICA (HOST '192.168.44.71' PRIORITY 1) DB 'tsg-bifang' TABLE 'tsg_cdn_domain_info')) LIFETIME(MIN 300 MAX 400) LAYOUT(FLAT());

 create table IF NOT EXISTS tsg_galaxy_v3.cdn_dic on cluster ck_cluster (`cdn_id` UInt64,
 `domain` String,
 `cname` String) Engine = Dictionary(cdn);

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.security_website_domain_info_local  on cluster ck_cluster(
	stat_time Int64,
	policy_id Int64,
	domain String,
	ip_list AggregateFunction(groupUniqArray,String),
	cdn_list AggregateFunction(groupUniqArray,String),
	protocol_type_list AggregateFunction(groupUniqArray,String),
	port_list  AggregateFunction(groupUniqArray,Int64)
) ENGINE = AggregatingMergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (policy_id,domain,stat_time) SETTINGS index_granularity = 8192;



CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.security_website_domain_info_local_view  on cluster ck_cluster TO tsg_galaxy_v3.security_website_domain_info_local (
stat_time UInt32,
policy_id Int64,
domain String,
ip_list AggregateFunction(groupUniqArray,
 String),
 cdn_list AggregateFunction(groupUniqArray,
 String),
 protocol_type_list AggregateFunction(groupUniqArray,
 String),
 port_list AggregateFunction(groupUniqArray,
 Int64)) AS SELECT toUnixTimestamp(toStartOfDay(toDate(common_recv_time))) AS stat_time,
 common_policy_id AS policy_id,
 http_domain AS domain,
 groupUniqArrayState(common_server_ip) AS ip_list,
 groupUniqArrayState(cc.domain) AS cdn_list,
 groupUniqArrayState(common_schema_type) AS protocol_type_list,
 groupUniqArrayState(common_server_port) AS port_list FROM (SELECT common_recv_time,
 common_policy_id,
 http_domain,
 common_server_ip,
 arrayJoin(splitByChar(';',
 replaceAll(ssl_san,
 '*',
 ''))) AS san,
 common_schema_type,
 common_server_port FROM tsg_galaxy_v3.security_event_log_local) AS sell INNER JOIN tsg_galaxy_v3.cdn_dic AS cc ON sell.san = cc.domain GROUP BY toStartOfDay(toDate(common_recv_time)),
 common_policy_id,
 http_domain;
 
CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.security_ip_info_local  on cluster ck_cluster (
	stat_time Int64,
	policy_id Int64,
	ip String,
	domain_list AggregateFunction(groupUniqArray,String),
	port_list  AggregateFunction(groupUniqArray,Int64)
) ENGINE = AggregatingMergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (policy_id,ip,stat_time) SETTINGS index_granularity = 8192;


CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.security_ip_info_local_view  on cluster ck_cluster TO tsg_galaxy_v3.security_ip_info_local AS
SELECT
	toUnixTimestamp(toStartOfDay(toDate(common_recv_time))) as stat_time,
	common_policy_id as policy_id,
	common_server_ip as ip,
	groupUniqArrayState(http_domain) as domain_list ,
	groupUniqArrayState(common_server_port) as port_list
FROM
	tsg_galaxy_v3.security_event_log_local
group BY
	toStartOfDay(toDate(common_recv_time)),
	common_policy_id,
	common_server_ip;


CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.proxy_ip_info_local  on cluster ck_cluster(
	stat_time Int64,
	policy_id Int64,
	ip_list AggregateFunction(groupUniqArray,String)
) ENGINE = AggregatingMergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (policy_id,stat_time) SETTINGS index_granularity = 8192;


CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.proxy_ip_info_local_view on cluster ck_cluster TO tsg_galaxy_v3.proxy_ip_info_local   (
 stat_time UInt32,
 policy_id Int64,
 ip_list AggregateFunction(groupUniqArray,
 String)) AS SELECT toUnixTimestamp(toStartOfMinute(toDateTime(common_recv_time))) AS stat_time,
 common_policy_id AS policy_id,
 groupUniqArrayState(common_client_ip) AS ip_list FROM tsg_galaxy_v3.proxy_event_log_local GROUP BY toStartOfMinute(toDateTime(common_recv_time)),
 common_policy_id;

create table IF NOT EXISTS tsg_galaxy_v3.security_website_domain_info on cluster ck_query 
(
	stat_time Int64,
	policy_id Int64,
	domain String,
	ip_list AggregateFunction(groupUniqArray,String),
	cdn_list AggregateFunction(groupUniqArray,String),
	protocol_type_list AggregateFunction(groupUniqArray,String),
	port_list  AggregateFunction(groupUniqArray,Int64)
)
ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,security_website_domain_info_local,rand());

create table IF NOT EXISTS tsg_galaxy_v3.security_ip_info on cluster ck_query (
stat_time Int64,
	policy_id Int64,
	ip String,
	domain_list AggregateFunction(groupUniqArray,String),
	port_list  AggregateFunction(groupUniqArray,Int64)
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,security_ip_info_local,rand());

create table IF NOT EXISTS tsg_galaxy_v3.proxy_ip_info on cluster ck_query (
stat_time Int64,
	policy_id Int64,
	ip_list AggregateFunction(groupUniqArray,String)
) ENGINE =Distributed(ck_cluster,tsg_galaxy_v3,proxy_ip_info_local,rand());


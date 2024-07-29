set distributed_ddl_task_timeout = 180;

ALTER table cyber_narrator_galaxy.location_subscriber_local on cluster ck_cluster add column IF NOT EXISTS data_source String after third_location;
ALTER table cyber_narrator_galaxy.location_subscriber on cluster ck_cluster add column IF NOT EXISTS data_source String after third_location;

drop view IF EXISTS cyber_narrator_galaxy.cn_entity_relation_view ON CLUSTER ck_cluster;
drop view IF EXISTS cyber_narrator_galaxy.cn_ip_dynamic_attribute_view ON CLUSTER ck_cluster;
drop view IF EXISTS cyber_narrator_galaxy.cn_entity_relation_view_metric ON CLUSTER ck_cluster;
drop view IF EXISTS cyber_narrator_galaxy.cn_ip_dynamic_attribute_view_metric ON CLUSTER ck_cluster;

drop table IF EXISTS cyber_narrator_galaxy.cn_entity_relation on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_relation on cluster ck_cluster;
drop table IF EXISTS cyber_narrator_galaxy.metric_ip_dynamic_attribute on cluster ck_cluster;


RENAME TABLE cyber_narrator_galaxy.cn_entity_relation_local TO cyber_narrator_galaxy.session_relation_domain_ip_app_local ON CLUSTER ck_cluster;
RENAME TABLE cyber_narrator_galaxy.metric_relation_local TO cyber_narrator_galaxy.raw_session_relation_domain_ip_app_local ON CLUSTER ck_cluster;
RENAME TABLE cyber_narrator_galaxy.metric_ip_dynamic_attribute_local TO cyber_narrator_galaxy.raw_cn_ip_dynamic_attribute_local ON CLUSTER ck_cluster;


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.session_relation_subscriber_app_local ON CLUSTER ck_cluster (
 app_name String,
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 app_category String,
 app_subcategory String,
 create_time Int64,
 update_time Int64
) ENGINE = MergeTree
 ORDER BY (subscriber_id, app_name)
 TTL toDateTime(update_time) + toIntervalSecond(2592000),
 toDateTime(update_time) + toIntervalSecond(1) 
 GROUP BY subscriber_id, app_name 
 SET create_time = min(create_time),
 update_time = max(update_time),
 imei = anyLast(imei),
 imsi = anyLast(imsi),
 phone_number = anyLast(phone_number),
 apn = anyLast(apn),
 app_category = anyLast(app_category),
 app_subcategory = anyLast(app_subcategory);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.session_relation_subscriber_app ON CLUSTER ck_cluster (
 app_name String,
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 app_category String,
 app_subcategory String,
 create_time Int64,
 update_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'session_relation_subscriber_app_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.raw_session_relation_subscriber_app_local ON CLUSTER ck_cluster (
 app_name String,
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 app_category String,
 app_subcategory String,
 stat_time Int64
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.raw_session_relation_subscriber_app ON CLUSTER ck_cluster (
 app_name String,
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 app_category String,
 app_subcategory String,
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'raw_session_relation_subscriber_app_local', rand());



 CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.session_relation_domain_ip_app on cluster ck_cluster
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
 'session_relation_domain_ip_app_local',
 rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.raw_session_relation_domain_ip_app ON CLUSTER ck_cluster (
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
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'raw_session_relation_domain_ip_app_local', rand());


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.raw_cn_ip_dynamic_attribute ON CLUSTER ck_cluster (
 ip String,
 l7_protocol String,
 port Int64,
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'raw_cn_ip_dynamic_attribute_local', rand());



CREATE MATERIALIZED VIEW if not exists cyber_narrator_galaxy.session_relation_domain_ip_app_view_metric on cluster ck_cluster 
TO cyber_narrator_galaxy.session_relation_domain_ip_app_local
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
FROM cyber_narrator_galaxy.raw_session_relation_domain_ip_app_local AS c1
GROUP BY
    ip,
    app_name,
    domain;   

CREATE MATERIALIZED VIEW if not exists cyber_narrator_galaxy.session_relation_subscriber_app_view_metric on cluster ck_cluster 
TO cyber_narrator_galaxy.session_relation_subscriber_app_local
(
    app_name String,
    subscriber_id String,
    imei String,
    imsi String,
    phone_number String,
    apn String,
    app_category String,
    app_subcategory String,
    create_time Int64,
    update_time Int64
) AS
SELECT
    app_name AS app_name,
    subscriber_id AS subscriber_id,
    anyLast(imei) AS imei,
    anyLast(imsi) AS imsi,
    anyLast(phone_number) AS phone_number,
    anyLast(apn) AS apn,
    anyLast(app_category) AS app_category,
    anyLast(app_subcategory) AS app_subcategory,
    min(c1.stat_time) AS create_time,
    max(c1.stat_time) AS update_time
FROM cyber_narrator_galaxy.raw_session_relation_subscriber_app_local AS c1
GROUP BY
    subscriber_id,
    app_name;   

CREATE MATERIALIZED VIEW if not exists cyber_narrator_galaxy.cn_ip_dynamic_attribute_view_metric on cluster ck_cluster 
TO cyber_narrator_galaxy.cn_ip_dynamic_attribute_local
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
FROM cyber_narrator_galaxy.raw_cn_ip_dynamic_attribute_local AS c1
GROUP BY
    ip,
    l7_protocol,
    port;


CREATE TABLE cyber_narrator_galaxy.metric_tag_local ON CLUSTER ck_cluster (
    tag String,
    stat_time Int64,
    ip_sketch String,
    domain_sketch String,
    ip_sketch_agg_state AggregateFunction(uniqTheta,String) MATERIALIZED base64Decode(ip_sketch),
    domain_sketch_agg_state AggregateFunction(uniqTheta,String) MATERIALIZED base64Decode(domain_sketch)
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(stat_time))
ORDER BY (stat_time, tag);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.metric_tag ON CLUSTER ck_cluster (
    tag String,
    stat_time Int64,
    ip_sketch String,
    domain_sketch String,
    ip_sketch_agg_state AggregateFunction(uniqTheta,String) MATERIALIZED base64Decode(ip_sketch),
    domain_sketch_agg_state AggregateFunction(uniqTheta,String) MATERIALIZED base64Decode(domain_sketch)
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'metric_tag_local', rand());
set distributed_ddl_task_timeout = 180;

CREATE TABLE cyber_narrator_galaxy.match_indicator_local ON CLUSTER ck_cluster (
    indicator_fields String,
    indicator_values String,
    match_num Int64,
    reset Int64,
    client_ip String,
    client_country_region String,
    client_super_admin_area String,
    client_admin_area String,
    client_longitude Nullable(Float64),
    client_latitude Nullable(Float64),
    server_ip String,
    server_country_region String,
    server_super_admin_area String,
    server_admin_area String,
    server_longitude Nullable(Float64),
    server_latitude Nullable(Float64),
    domain String,
    app String,
    match_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(match_time))
ORDER BY (match_id, match_time);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.match_indicator ON CLUSTER ck_cluster (
    indicator_fields String,
    indicator_values String,
    match_num Int64,
    reset Int64,
    client_ip String,
    client_country_region String,
    client_super_admin_area String,
    client_admin_area String,
    client_longitude Nullable(Float64),
    client_latitude Nullable(Float64),
    server_ip String,
    server_country_region String,
    server_super_admin_area String,
    server_admin_area String,
    server_longitude Nullable(Float64),
    server_latitude Nullable(Float64),
    domain String,
    app String,
    match_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'match_indicator_local', rand());


CREATE TABLE cyber_narrator_galaxy.match_threshold_local ON CLUSTER ck_cluster (
    key_fields String,
    key_values String,
    threshold_value Float32,
    metric_value Float32,
    unit Int64 DEFAULT 1,
	reset Int64,
    start_time Int64,
    end_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(start_time))
ORDER BY (match_id, start_time);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.match_threshold ON CLUSTER ck_cluster (
    key_fields String,
    key_values String,
    threshold_value Float32,
    metric_value Float32,
	unit Int64 DEFAULT 1,
    reset Int64,
    start_time Int64,
    end_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'match_threshold_local', rand());


CREATE TABLE cyber_narrator_galaxy.match_sequence_local ON CLUSTER ck_cluster (
    key_fields String,
    key_values String,
    event_info String,
    start_time Int64,
    end_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(start_time))
ORDER BY (match_id, start_time);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.match_sequence ON CLUSTER ck_cluster (
    key_fields String,
    key_values String,
    event_info String,
    start_time Int64,
    end_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'match_sequence_local', rand());


CREATE TABLE cyber_narrator_galaxy.match_unordered_sequence_local ON CLUSTER ck_cluster (
    key_fields String,
    key_values String,
    event_info String,
    start_time Int64,
    end_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(start_time))
ORDER BY (match_id, start_time);

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.match_unordered_sequence ON CLUSTER ck_cluster (
    key_fields String,
    key_values String,
    event_info String,
    start_time Int64,
    end_time Int64,
    match_id UInt64,
    rule_id UInt64,
    rule_version String,
    rule_type String,
    is_builtin Int64,
    event_type String,
    event_name String,
    severity Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'match_unordered_sequence_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_event_local ON CLUSTER ck_cluster(
    event_id UInt64, 
    match_ids SimpleAggregateFunction(anyLast, String),
    key_fields SimpleAggregateFunction(anyLast, String),
    key_values SimpleAggregateFunction(anyLast, String),
    rule_id SimpleAggregateFunction(anyLast, Int64),
    rule_version SimpleAggregateFunction(anyLast, String),
    rule_type SimpleAggregateFunction(anyLast, Int8),
    is_builtin SimpleAggregateFunction(anyLast, Int8),
    event_type SimpleAggregateFunction(anyLast, String),
    event_name SimpleAggregateFunction(anyLast, String),
    reset SimpleAggregateFunction(anyLast, Int64),
    start_time SimpleAggregateFunction(min, Int64),
    end_time SimpleAggregateFunction(max, Int64),
    duration_s SimpleAggregateFunction(max, Int64),
    status SimpleAggregateFunction(max, Int8)
) 
ENGINE=AggregatingMergeTree ORDER BY event_id;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_event ON CLUSTER ck_cluster(
    event_id UInt64, 
    match_ids SimpleAggregateFunction(anyLast, String),
    key_fields SimpleAggregateFunction(anyLast, String),
    key_values SimpleAggregateFunction(anyLast, String),
    rule_id SimpleAggregateFunction(anyLast, Int64),
    rule_version SimpleAggregateFunction(anyLast, String),
    rule_type SimpleAggregateFunction(anyLast, Int8),
    is_builtin SimpleAggregateFunction(anyLast, Int8),
    event_type SimpleAggregateFunction(anyLast, String),
    event_name SimpleAggregateFunction(anyLast, String),
    reset SimpleAggregateFunction(anyLast, Int64),
    start_time SimpleAggregateFunction(min, Int64),
    end_time SimpleAggregateFunction(max, Int64),
    duration_s SimpleAggregateFunction(max, Int64),
    status SimpleAggregateFunction(max, Int8)
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_event_local',
 rand());
 
 
ALTER table cyber_narrator_galaxy.location_subscriber_local ON CLUSTER ck_cluster add column IF NOT EXISTS cell_type Int64 after apn;
ALTER table cyber_narrator_galaxy.location_subscriber ON CLUSTER ck_cluster add column IF NOT EXISTS cell_type Int64 after apn;

ALTER table cyber_narrator_galaxy.location_subscriber_local ON CLUSTER ck_cluster add column IF NOT EXISTS cell_id String after apn;
ALTER table cyber_narrator_galaxy.location_subscriber ON CLUSTER ck_cluster add column IF NOT EXISTS cell_id String after apn;


ALTER table cyber_narrator_galaxy.session_relation_subscriber_app_local ON CLUSTER ck_cluster add column IF NOT EXISTS entity_tags Array(String) after app_subcategory;
ALTER table cyber_narrator_galaxy.session_relation_subscriber_app ON CLUSTER ck_cluster add column IF NOT EXISTS entity_tags Array(String) after app_subcategory;

ALTER table cyber_narrator_galaxy.raw_session_relation_subscriber_app_local ON CLUSTER ck_cluster add column IF NOT EXISTS entity_tags Array(String) after app_subcategory;
ALTER table cyber_narrator_galaxy.raw_session_relation_subscriber_app ON CLUSTER ck_cluster add column IF NOT EXISTS entity_tags Array(String) after app_subcategory;

ALTER table cyber_narrator_galaxy.session_relation_subscriber_app_local on cluster ck_cluster MODIFY 
 TTL toDateTime(update_time) + toIntervalSecond(2592000),
 toDateTime(update_time) + toIntervalSecond(1) GROUP BY subscriber_id,
 app_name SET create_time = min(create_time),
 update_time = max(update_time),
 imei = anyLast(imei),
 imsi = anyLast(imsi),
 phone_number = anyLast(phone_number),
 apn = anyLast(apn),
 app_category = anyLast(app_category),
 app_subcategory = anyLast(app_subcategory),
entity_tags = groupUniqArrayArray(entity_tags);

DROP VIEW IF EXISTS cyber_narrator_galaxy.session_relation_subscriber_app_view_metric on cluster ck_cluster;

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
    entity_tags Array(String),
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
    groupUniqArrayArray(entity_tags) AS entity_tags,
    min(c1.stat_time) AS create_time,
    max(c1.stat_time) AS update_time
FROM cyber_narrator_galaxy.raw_session_relation_subscriber_app_local AS c1
GROUP BY
    subscriber_id,
    app_name;   
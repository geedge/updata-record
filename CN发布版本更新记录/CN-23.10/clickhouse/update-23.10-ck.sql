set distributed_ddl_task_timeout = 180;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS asymmetric_sessions Int64 after avg_ssl_con_latency_ms;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS asymmetric_sessions Int64 after avg_ssl_con_latency_ms;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS asymmetric_sessions Int64 after avg_ssl_con_latency_ms;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS bulky_sessions Int64 after asymmetric_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS bulky_sessions Int64 after asymmetric_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS bulky_sessions Int64 after asymmetric_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS cbr_streaming_sessions Int64 after bulky_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS cbr_streaming_sessions Int64 after bulky_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS cbr_streaming_sessions Int64 after bulky_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS download_sessions Int64 after cbr_streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS download_sessions Int64 after cbr_streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS download_sessions Int64 after cbr_streaming_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS interactive_sessions Int64 after download_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS interactive_sessions Int64 after download_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS interactive_sessions Int64 after download_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS pseudo_unidirectional_sessions Int64 after interactive_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS pseudo_unidirectional_sessions Int64 after interactive_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS pseudo_unidirectional_sessions Int64 after interactive_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS streaming_sessions Int64 after pseudo_unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS streaming_sessions Int64 after pseudo_unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS streaming_sessions Int64 after pseudo_unidirectional_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS unidirectional_sessions Int64 after streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS unidirectional_sessions Int64 after streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS unidirectional_sessions Int64 after streaming_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS random_looking_sessions Int64 after unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS random_looking_sessions Int64 after unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS random_looking_sessions Int64 after unidirectional_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS bidirectional_sessions Int64 after random_looking_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS bidirectional_sessions Int64 after random_looking_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS bidirectional_sessions Int64 after random_looking_sessions;


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_security_event_local ON CLUSTER ck_cluster
(

    status Int64,
    is_builtin Int64,
    rule_type String,
    victim_ip String,
    offender_ip String,
    event_info String,
    event_key String,
    severity String,
    event_type String,
    duration_s Int64,
    event_name String,
    app String,
    domain String,
    event_id Int64,
    rule_id Int64,
    start_time Int64,
    end_time Int64,
    match_times Int64
)
ENGINE = MergeTree
ORDER BY event_id
TTL toDateTime(end_time) + toIntervalSecond(2592000),
 toDateTime(end_time) + toIntervalSecond(1) GROUP BY event_id
 SET 
 status = anyLast(status),
 is_builtin = anyLast(is_builtin),
 rule_type = anyLast(rule_type),
 victim_ip = anyLast(victim_ip),
 offender_ip = anyLast(offender_ip),
 event_info = anyLast(event_info),
 event_key = anyLast(event_key),
 severity = anyLast(severity),
 event_type = anyLast(event_type),
 duration_s = anyLast(duration_s),
 event_name = anyLast(event_name),
 app = anyLast(app),
 domain = anyLast(domain), 
 rule_id = anyLast(rule_id), 
 start_time = anyLast(start_time),
 end_time = max(end_time),
 match_times = anyLast(match_times);


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_security_event ON CLUSTER ck_cluster
(

    status Int64,
    is_builtin Int64,
    rule_type String,
    victim_ip String,
    offender_ip String,
    event_info String,
    event_key String,
    severity String,
    event_type String,
    duration_s Int64,
    event_name String,
    app String,
    domain String,
    event_id Int64,
    rule_id Int64,
    start_time Int64,
    end_time Int64,
    match_times Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_security_event_local',
 rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.cn_security_event  ON CLUSTER ck_query
(

    status Int64,
    is_builtin Int64,
    rule_type String,
    victim_ip String,
    offender_ip String,
    event_info String,
    event_key String,
    severity String,
    event_type String,
    duration_s Int64,
    event_name String,
    app String,
    domain String,
    event_id Int64,
    rule_id Int64,
    start_time Int64,
    end_time Int64,
    match_times Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_security_event_local',
 rand());


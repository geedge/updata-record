set distributed_ddl_task_timeout = 180;

ALTER table cyber_narrator_galaxy.metric_subscriber_app_local on cluster ck_cluster  drop column IF EXISTS subscriber_longitude, drop column IF EXISTS subscriber_latitude;
ALTER table cyber_narrator_galaxy.metric_subscriber_app on cluster ck_cluster drop column IF EXISTS subscriber_longitude, drop column IF EXISTS subscriber_latitude;
ALTER table cyber_narrator_galaxy.metric_subscriber_app on cluster ck_query drop column IF EXISTS subscriber_longitude, drop column IF EXISTS subscriber_latitude;


CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.location_subscriber_local ON CLUSTER ck_cluster (
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 subscriber_longitude Nullable(Float64),
 subscriber_latitude Nullable(Float64),
 first_location String,
 second_location String,
 third_location String,
 stat_time Int64
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(stat_time)) ORDER BY (stat_time,subscriber_id) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.location_subscriber ON CLUSTER ck_cluster (
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 subscriber_longitude Nullable(Float64),
 subscriber_latitude Nullable(Float64),
 first_location String,
 second_location String,
 third_location String,
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'location_subscriber_local', rand());

CREATE TABLE IF NOT EXISTS cyber_narrator_galaxy.location_subscriber ON CLUSTER ck_query (
 subscriber_id String,
 imei String,
 imsi String,
 phone_number String,
 apn String,
 subscriber_longitude Nullable(Float64),
 subscriber_latitude Nullable(Float64),
 first_location String,
 second_location String,
 third_location String,
 stat_time Int64
) ENGINE = Distributed('ck_cluster', 'cyber_narrator_galaxy', 'location_subscriber_local', rand());

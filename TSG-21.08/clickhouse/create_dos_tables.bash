

CREATE TABLE tsg_galaxy_v3.dos_event_log_local on cluster ck_cluster(
log_id UInt64,
 start_time Int64,
 end_time Int64,
 attack_type String,
 severity String,
 conditions String,
 destination_ip String,
 destination_country String,
 source_ip_list String,
 source_country_list String,
 session_rate Int64,
 packet_rate Int64,
 bit_rate Int64
) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(start_time)) ORDER BY (log_id, start_time, destination_ip) SETTINGS index_granularity = 8192;


CREATE TABLE tsg_galaxy_v3.dos_event_log on cluster ck_query(
 log_id UInt64,
 start_time Int64,
 end_time Int64,
 attack_type String,
 severity String,
 conditions String,
 destination_ip String,
 destination_country String,
 source_ip_list String,
 source_country_list String,
 session_rate Int64,
 packet_rate Int64,
 bit_rate Int64
) ENGINE = Distributed('ck_cluster', 'tsg_galaxy_v3', 'dos_event_log_local', rand());
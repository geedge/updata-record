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
    threshold_num Int64,
    records_num Int64,
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
    threshold_num Int64,
    records_num Int64,
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

set distributed_ddl_task_timeout = 180;

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.datapath_telemetry_record_local on cluster ck_cluster (
    log_id UInt64,
    recv_time Int64,
    vsys_id Int32,
    timestamp_us UInt64,
    job_id String,
    sled_ip String,
    device_group String,
    source_ip String,
    source_port Int32,
    destination_ip String,
    destination_port Int32,
    packet String,
    packet_length Int32,
    measurements String
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(recv_time))
ORDER BY (vsys_id,job_id,recv_time,timestamp_us);

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.datapath_telemetry_record on cluster ck_cluster (
    log_id UInt64,
    recv_time Int64,
    vsys_id Int32,
    timestamp_us UInt64,
    job_id String,
    sled_ip String,
    device_group String,
    source_ip String,
    source_port Int32,
    destination_ip String,
    destination_port Int32,
    packet String,
    packet_length Int32,
    measurements String
)
ENGINE = Distributed('ck_cluster',
 'tsg_galaxy_v3',
 'datapath_telemetry_record_local',
 rand());
 
 CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.datapath_telemetry_record on cluster ck_query (
    log_id UInt64,
    recv_time Int64,
    vsys_id Int32,
    timestamp_us UInt64,
    job_id String,
    sled_ip String,
    device_group String,
    source_ip String,
    source_port Int32,
    destination_ip String,
    destination_port Int32,
    packet String,
    packet_length Int32,
    measurements String
)
ENGINE = Distributed('ck_cluster',
 'tsg_galaxy_v3',
 'datapath_telemetry_record_local',
 rand());

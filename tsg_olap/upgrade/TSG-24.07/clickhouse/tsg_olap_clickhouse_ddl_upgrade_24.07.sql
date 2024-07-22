set distributed_ddl_task_timeout = 180;

-- TSG-21759 clickhouse datapath_telemetry_record 新增字段egress_action
ALTER table tsg_galaxy_v3.datapath_telemetry_record_local on cluster ck_cluster add column IF NOT EXISTS egress_action Int32 after timestamp_us;
ALTER table tsg_galaxy_v3.datapath_telemetry_record on cluster ck_cluster add column IF NOT EXISTS egress_action Int32 after timestamp_us;

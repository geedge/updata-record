set distributed_ddl_task_timeout = 180;

-- DoS Event 新增字段：bytes, sessions, packets , rule_id 

ALTER table tsg_galaxy_v3.dos_event_local on cluster ck_cluster add column IF NOT EXISTS rule_id Int64 after profile_id;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_cluster add column IF NOT EXISTS rule_id Int64 after profile_id;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_query add column IF NOT EXISTS rule_id Int64 after profile_id;

ALTER table tsg_galaxy_v3.dos_event_local on cluster ck_cluster add column IF NOT EXISTS sessions Int64 after source_country_list;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_cluster add column IF NOT EXISTS sessions Int64 after source_country_list;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_query add column IF NOT EXISTS sessions Int64 after source_country_list;

ALTER table tsg_galaxy_v3.dos_event_local on cluster ck_cluster add column IF NOT EXISTS packets Int64 after session_rate;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_cluster add column IF NOT EXISTS packets Int64 after session_rate;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_query add column IF NOT EXISTS packets Int64 after session_rate;

ALTER table tsg_galaxy_v3.dos_event_local on cluster ck_cluster add column IF NOT EXISTS bytes Int64 after packet_rate;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_cluster add column IF NOT EXISTS bytes Int64 after packet_rate;
ALTER table tsg_galaxy_v3.dos_event on cluster ck_query add column IF NOT EXISTS bytes Int64 after packet_rate;


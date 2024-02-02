--------https://jira.geedge.net/browse/TSG-7197
ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_mirrored_pkts Int64 after common_tcp_server_isn;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_mirrored_pkts Int64 after common_tcp_server_isn;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_mirrored_bytes Int64 after common_mirrored_pkts;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_mirrored_bytes Int64 after common_mirrored_pkts;

ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_mirrored_pkts Int64 after common_tcp_server_isn;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_mirrored_bytes Int64 after common_mirrored_pkts;
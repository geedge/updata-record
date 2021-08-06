----通联日志
ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_l7_protocol LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_l7_protocol LowCardinality(String);

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_l4_protocol LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_l4_protocol LowCardinality(String);

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_schema_type LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_schema_type LowCardinality(String);

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_client_location LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_client_location LowCardinality(String);

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_server_location LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_server_location LowCardinality(String);

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_app_label LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster MODIFY COLUMN IF EXISTS common_app_label LowCardinality(String);


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query MODIFY COLUMN IF EXISTS common_l7_protocol LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query MODIFY COLUMN IF EXISTS common_l4_protocol LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query MODIFY COLUMN IF EXISTS common_schema_type LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query MODIFY COLUMN IF EXISTS common_client_location LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query MODIFY COLUMN IF EXISTS common_server_location LowCardinality(String);
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query MODIFY COLUMN IF EXISTS common_app_label LowCardinality(String);

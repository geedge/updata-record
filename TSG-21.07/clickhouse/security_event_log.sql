--------https://jira.geedge.net/browse/TSG-6878
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_link_id;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query DROP COLUMN IF EXISTS common_link_id;
ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_link_id;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_egress_link_id Nullable(Int64) after common_device_id;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_egress_link_id Nullable(Int64) after common_device_id;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_ingress_link_id Nullable(Int64) after common_egress_link_id;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_ingress_link_id Nullable(Int64) after common_egress_link_id;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_egress_link_id Nullable(Int64) after common_device_id;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_ingress_link_id Nullable(Int64) after common_egress_link_id;

--------https://jira.geedge.net/browse/TSG-6878

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_userdefine_app_name String after common_app_id;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_userdefine_app_name String after common_app_id;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_userdefine_app_name String after common_app_id;

--------https://jira.geedge.net/browse/TSG-6957
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster DROP COLUMN IF EXISTS http_response_lantency_ms;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query DROP COLUMN IF EXISTS http_response_lantency_ms;
ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS http_response_lantency_ms;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_latency_ms Int64 after http_version;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_latency_ms Int64 after http_version;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_latency_ms Int64 after http_version;
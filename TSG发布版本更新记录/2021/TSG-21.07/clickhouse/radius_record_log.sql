--------https://jira.geedge.net/browse/TSG-6878
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_link_id;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query DROP COLUMN IF EXISTS common_link_id;
ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_link_id;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_egress_link_id Nullable(Int64) after common_device_id;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_egress_link_id Nullable(Int64) after common_device_id;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_ingress_link_id Nullable(Int64) after common_egress_link_id;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_ingress_link_id Nullable(Int64) after common_egress_link_id;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_egress_link_id Nullable(Int64) after common_device_id;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_ingress_link_id Nullable(Int64) after common_egress_link_id;

--------https://jira.geedge.net/browse/TSG-6878

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_userdefine_app_name String after common_app_id;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_userdefine_app_name String after common_app_id;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_userdefine_app_name String after common_app_id;
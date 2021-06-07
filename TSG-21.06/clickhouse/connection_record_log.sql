ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_service_category;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query DROP COLUMN IF EXISTS common_service_category;
ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_service_category;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category Array(Int64) after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category Array(Int64) after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS ftp_link_type String after ftp_content;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS ftp_link_type String after ftp_content;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category Array(Int64) after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS ftp_link_type String after ftp_content;

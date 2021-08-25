--删除子表
DROP TABLE IF EXISTS tsg_galaxy_v3.common_client_ip ON CLUSTER ck_cluster ;
DROP TABLE IF EXISTS tsg_galaxy_v3.common_server_ip ON CLUSTER ck_cluster ;
DROP TABLE IF EXISTS tsg_galaxy_v3.common_subscriber_id ON CLUSTER ck_cluster ;
DROP TABLE IF EXISTS tsg_galaxy_v3.common_http_domain ON CLUSTER ck_cluster ;
DROP TABLE IF EXISTS tsg_galaxy_v3.connection_record_log_common_subscriber_id_local ON CLUSTER ck_cluster ;
DROP TABLE IF EXISTS tsg_galaxy_v3.connection_record_log_common_subscriber_id ON CLUSTER ck_cluster ;
DROP TABLE IF EXISTS tsg_galaxy_v3.connection_record_log_common_subscriber_id ON CLUSTER ck_query ;

--删除子表多余字段
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_action;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_action;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_action;

ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_action;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_action;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster DROP COLUMN IF EXISTS common_action;

ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query DROP COLUMN IF EXISTS common_action;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query DROP COLUMN IF EXISTS common_action;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query DROP COLUMN IF EXISTS common_policy_id;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query DROP COLUMN IF EXISTS common_action;

--增加子表字段
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;


ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_client_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_common_server_ip ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;

ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_schema_type LowCardinality(String) after ssl_sni;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_client_port Int64 after common_schema_type;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_server_port Int64 after common_client_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_label LowCardinality(String) after common_server_port;
ALTER TABLE tsg_galaxy_v3.connection_record_log_http_domain ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_direction Int64 after common_app_label;


--创建视图
CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.common_client_ip ON CLUSTER ck_cluster TO tsg_galaxy_v3.connection_record_log_common_client_ip_local AS SELECT common_log_id, common_recv_time, common_server_ip, common_client_ip, common_sled_ip, common_entrance_id, common_subscriber_id, common_stream_trace_id, http_domain, ssl_sni,common_schema_type,common_client_port,common_server_port,common_app_label,common_direction FROM tsg_galaxy_v3.connection_record_log_local;
CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.common_server_ip ON CLUSTER ck_cluster TO tsg_galaxy_v3.connection_record_log_common_server_ip_local AS SELECT common_log_id, common_recv_time, common_server_ip, common_client_ip, common_sled_ip, common_entrance_id, common_subscriber_id, common_stream_trace_id, http_domain, ssl_sni,common_schema_type,common_client_port,common_server_port,common_app_label,common_direction FROM tsg_galaxy_v3.connection_record_log_local;
CREATE MATERIALIZED VIEW IF NOT EXISTS tsg_galaxy_v3.common_http_domain ON CLUSTER ck_cluster TO tsg_galaxy_v3.connection_record_log_http_domain_local AS SELECT common_log_id, common_recv_time, common_server_ip, common_client_ip, common_sled_ip, common_entrance_id, common_subscriber_id, common_stream_trace_id, http_domain, ssl_sni,common_schema_type,common_client_port,common_server_port,common_app_label,common_direction FROM tsg_galaxy_v3.connection_record_log_local;

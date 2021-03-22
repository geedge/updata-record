ALTER TABLE tsg_galaxy_v3.connection_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.proxy_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.radius_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.security_event_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.voip_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;


ALTER TABLE tsg_galaxy_v3.connection_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.proxy_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.radius_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.security_event_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.voip_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;

ALTER TABLE tsg_galaxy_v3.sys_packet_capture_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_tunnels String after common_encapsulation;



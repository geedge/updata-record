ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.radius_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.gtpc_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.voip_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
	
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.radius_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.gtpc_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.voip_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 

ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.radius_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.gtpc_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 
ALTER TABLE tsg_galaxy_v3.voip_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_app_behavior String after common_device_group; 


ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.radius_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.gtpc_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.voip_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;

ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.radius_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.gtpc_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.voip_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;

ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.radius_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.gtpc_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;
ALTER TABLE tsg_galaxy_v3.voip_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_packet_capture_file String after common_link_info_s2c;








ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;


ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;



ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;


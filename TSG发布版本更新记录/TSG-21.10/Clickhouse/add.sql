ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 



ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 

ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_response_content_length String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_type String after http_user_agent; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS http_request_content_length String after http_user_agent; 





ALTER TABLE tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.proxy_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.radius_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.gtpc_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.voip_record_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
	
ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.radius_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.gtpc_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.voip_record ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 

ALTER TABLE tsg_galaxy_v3.session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.transaction_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.security_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.proxy_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.sys_packet_capture_event ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.radius_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.gtpc_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 
ALTER TABLE tsg_galaxy_v3.voip_record ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_device_group String after common_sled_ip; 






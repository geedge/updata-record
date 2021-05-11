
ALTER TABLE IF EXISTS live_session_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS live_session_record_log MODIFY COLUMN common_app_id String;

ALTER TABLE IF EXISTS connection_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS connection_record_log MODIFY COLUMN common_app_id String;


ALTER TABLE IF EXISTS proxy_event_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS proxy_event_log MODIFY COLUMN common_app_id String;


ALTER TABLE IF EXISTS radius_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS radius_record_log MODIFY COLUMN common_app_id String;


ALTER TABLE IF EXISTS security_event_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS security_event_log MODIFY COLUMN common_app_id String;

 
ALTER TABLE IF EXISTS sys_packet_capture_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS sys_packet_capture_log MODIFY COLUMN common_app_id String;


ALTER TABLE IF EXISTS transaction_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS transaction_record_log MODIFY COLUMN common_app_id String;


ALTER TABLE IF EXISTS voip_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS voip_record_log MODIFY COLUMN common_app_id String;


ALTER TABLE IF EXISTS gtpc_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE IF EXISTS gtpc_record_log MODIFY COLUMN common_app_id String;

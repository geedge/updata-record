ALTER TABLE live_session_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE live_session_record_log MODIFY COLUMN common_app_id String;

ALTER TABLE connection_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE connection_record_log MODIFY COLUMN common_app_id String;

ALTER TABLE proxy_event_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE proxy_event_log MODIFY COLUMN common_app_id String;

ALTER TABLE radius_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE radius_record_log MODIFY COLUMN common_app_id String;

ALTER TABLE security_event_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE security_event_log MODIFY COLUMN common_app_id String;

ALTER TABLE sys_packet_capture_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE sys_packet_capture_log MODIFY COLUMN common_app_id String;

ALTER TABLE transaction_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE transaction_record_log MODIFY COLUMN common_app_id String;

ALTER TABLE voip_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE voip_record_log MODIFY COLUMN common_app_id String;

ALTER TABLE gtpc_record_log MODIFY COLUMN common_app_surrogate_id String;
ALTER TABLE gtpc_record_log MODIFY COLUMN common_app_id String;

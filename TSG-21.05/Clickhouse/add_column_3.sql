ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

------------------------------
ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
----------------------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
---------------------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
--------------------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_service_category String after common_protocol_label;
-----------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_diff Int64 after common_s2c_pkt_num;
---------------------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_diff Int64 after common_c2s_pkt_diff;
-----------------------------

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_diff Int64 after common_s2c_pkt_diff;
-------------------------------


ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_diff Int64 after common_c2s_byte_diff;
------------------------

ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;

---------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;

-------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;

---------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;

--------------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;

-------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;

---------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;

ALTER TABLE tsg_galaxy_v3.live_session_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;
ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;

ALTER TABLE tsg_galaxy_v3.transaction_record_log_local ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;
ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_cluster ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;

------------------------------





ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_imei String after common_subscriber_id;

--------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_imsi String after common_imei;

----------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_phone_number String after common_imsi;

-------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_pkt_retrans Int64 after common_s2c_tcp_unorder_num;

---------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_pkt_retrans Int64 after common_c2s_pkt_retrans;

------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_c2s_byte_retrans Int64 after common_s2c_pkt_retrans;

----------------------------
ALTER TABLE tsg_galaxy_v3.gtpc_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;

ALTER TABLE tsg_galaxy_v3.live_session_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;

ALTER TABLE tsg_galaxy_v3.transaction_record_log ON CLUSTER ck_query ADD COLUMN IF NOT EXISTS common_s2c_byte_retrans Int64 after common_c2s_byte_retrans;

---------------------------------


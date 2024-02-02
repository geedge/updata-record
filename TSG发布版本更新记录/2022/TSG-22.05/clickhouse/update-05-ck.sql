ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_encryption_method  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_encryption_level  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_certificate_permanent  Int64 after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_certificate_count  Int64 after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_certificate_type  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_requested_color_depth  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_desktop_height  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_desktop_width  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_client_product_id  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_client_name  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_client_version  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_keyboard_layout  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_client_channels  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_security_protocol  String after app_extra_info;

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after app_extra_info;
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS rdp_cookie  String after app_extra_info;


ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_encryption_method  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_encryption_level  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_certificate_permanent  Int64 after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_certificate_count  Int64 after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_certificate_type  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_requested_color_depth  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_desktop_height  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_desktop_width  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_client_product_id  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_client_name  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_client_version  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_keyboard_layout  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_client_channels  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_security_protocol  String after stratum_mining_program;

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after stratum_mining_program;
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS rdp_cookie  String after stratum_mining_program;


ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_encryption_method  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_encryption_level  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_certificate_permanent  Int64 after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_certificate_count  Int64 after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_certificate_type  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_requested_color_depth  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_desktop_height  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_desktop_width  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_client_product_id  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_client_name  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_client_version  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_keyboard_layout  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_client_channels  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_security_protocol  String after app_extra_info;

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after app_extra_info;
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS rdp_cookie  String after app_extra_info;


ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_method  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_encryption_method  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_encryption_level  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_encryption_level  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_permanent  Int64 after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_certificate_permanent  Int64 after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_count  Int64 after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_certificate_count  Int64 after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_certificate_type  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_certificate_type  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_requested_color_depth  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_requested_color_depth  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_height  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_desktop_height  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_desktop_width  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_desktop_width  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_product_id  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_client_product_id  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_name  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_client_name  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_version  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_client_version  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_keyboard_layout  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_keyboard_layout  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_client_channels  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_client_channels  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_security_protocol  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_security_protocol  String after doh_rr;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS rdp_cookie  String after doh_rr;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS rdp_cookie  String after doh_rr;


ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query MODIFY column IF EXISTS ssl_client_side_latency  Nullable(Int64);

ALTER  table tsg_galaxy_v3.session_record_local on cluster ck_cluster MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.session_record on cluster ck_cluster MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.session_record on cluster ck_query MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);

ALTER  table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_cluster MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.interim_session_record on cluster ck_query MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);

ALTER  table tsg_galaxy_v3.security_event_local on cluster ck_cluster MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.security_event on cluster ck_cluster MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);
ALTER  table tsg_galaxy_v3.security_event on cluster ck_query MODIFY column IF EXISTS ssl_server_side_latency  Nullable(Int64);

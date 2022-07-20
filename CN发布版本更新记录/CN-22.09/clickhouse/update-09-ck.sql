ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_con_duration_ms  Int64 after common_end_time;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_con_duration_ms  Int64 after common_end_time;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_con_duration_ms  Int64 after common_end_time;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_app_id  String after common_app_label;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_app_id  String after common_app_label;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_app_id  String after common_app_label;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS client_zone  String after domain_whois_org;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS client_zone  String after domain_whois_org;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS client_zone  String after domain_whois_org;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS server_zone  String after client_idc_renter;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS server_zone  String after client_idc_renter;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS server_zone  String after client_idc_renter;

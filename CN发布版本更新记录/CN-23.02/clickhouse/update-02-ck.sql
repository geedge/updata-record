


ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS domain_tags  Array(String) after domain_whois_org;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS domain_tags  Array(String) after domain_whois_org;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS domain_tags  Array(String) after domain_whois_org;


ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS http_host_tags  Array(String) after domain_tags;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS http_host_tags  Array(String) after domain_tags;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS http_host_tags  Array(String) after domain_tags;


ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS ssl_sni_tags  Array(String) after http_host_tags;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS ssl_sni_tags  Array(String) after http_host_tags;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS ssl_sni_tags  Array(String) after http_host_tags;



ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS client_ip_tags  Array(String) after client_idc_renter;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS client_ip_tags  Array(String) after client_idc_renter;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS client_ip_tags  Array(String) after client_idc_renter;



ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS server_ip_tags  Array(String) after server_idc_renter;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS server_ip_tags  Array(String) after server_idc_renter;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS server_ip_tags  Array(String) after server_idc_renter;


ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS app_tags  Array(String) after app_risk;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS app_tags  Array(String) after app_risk;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS app_tags  Array(String) after app_risk;




































ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS client_whois_owner String after client_isp;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS client_whois_owner String after client_isp;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS client_whois_owner String after client_isp;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS client_idc_renter String after client_whois_owner;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS client_idc_renter String after client_whois_owner;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS client_idc_renter String after client_whois_owner;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS server_whois_owner String after server_isp;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS server_whois_owner String after server_isp;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS server_whois_owner String after server_isp;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS server_idc_renter String after server_whois_owner;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS server_idc_renter String after server_whois_owner;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS server_idc_renter String after server_whois_owner;


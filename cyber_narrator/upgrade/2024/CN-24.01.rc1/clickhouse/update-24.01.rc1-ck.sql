set distributed_ddl_task_timeout = 180;

ALTER  table cyber_narrator_galaxy.cn_security_event_local on cluster ck_cluster 
add column IF NOT EXISTS offender_latitude Nullable(Float64) after offender_ip,
add column IF NOT EXISTS offender_longitude Nullable(Float64) after offender_ip,
add column IF NOT EXISTS offender_admin_area String after offender_ip,
add column IF NOT EXISTS offender_super_admin_area String after offender_ip,
add column IF NOT EXISTS offender_country_region String after offender_ip,
add column IF NOT EXISTS victim_latitude Nullable(Float64) after victim_ip,
add column IF NOT EXISTS victim_longitude Nullable(Float64) after victim_ip,
add column IF NOT EXISTS victim_admin_area String after victim_ip,
add column IF NOT EXISTS victim_super_admin_area String after victim_ip,
add column IF NOT EXISTS victim_country_region String after victim_ip;

ALTER  table cyber_narrator_galaxy.cn_security_event on cluster ck_cluster 
add column IF NOT EXISTS offender_latitude Nullable(Float64) after offender_ip,
add column IF NOT EXISTS offender_longitude Nullable(Float64) after offender_ip,
add column IF NOT EXISTS offender_admin_area String after offender_ip,
add column IF NOT EXISTS offender_super_admin_area String after offender_ip,
add column IF NOT EXISTS offender_country_region String after offender_ip,
add column IF NOT EXISTS victim_latitude Nullable(Float64) after victim_ip,
add column IF NOT EXISTS victim_longitude Nullable(Float64) after victim_ip,
add column IF NOT EXISTS victim_admin_area String after victim_ip,
add column IF NOT EXISTS victim_super_admin_area String after victim_ip,
add column IF NOT EXISTS victim_country_region String after victim_ip;

ALTER  table cyber_narrator_galaxy.cn_security_event on cluster ck_query 
add column IF NOT EXISTS offender_latitude Nullable(Float64) after offender_ip,
add column IF NOT EXISTS offender_longitude Nullable(Float64) after offender_ip,
add column IF NOT EXISTS offender_admin_area String after offender_ip,
add column IF NOT EXISTS offender_super_admin_area String after offender_ip,
add column IF NOT EXISTS offender_country_region String after offender_ip,
add column IF NOT EXISTS victim_latitude Nullable(Float64) after victim_ip,
add column IF NOT EXISTS victim_longitude Nullable(Float64) after victim_ip,
add column IF NOT EXISTS victim_admin_area String after victim_ip,
add column IF NOT EXISTS victim_super_admin_area String after victim_ip,
add column IF NOT EXISTS victim_country_region String after victim_ip;
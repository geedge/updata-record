ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_end_time Int64 after common_stream_dir;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_end_time Int64 after common_stream_dir;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_end_time Int64 after common_stream_dir;

ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_start_time Int64 after common_stream_dir;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_start_time Int64 after common_stream_dir;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_start_time Int64 after common_stream_dir;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS stratum_mining_program String after ssh_hassh;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS stratum_mining_program String after ssh_hassh;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS stratum_mining_pools String after ssh_hassh;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS stratum_mining_pools String after ssh_hassh;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS stratum_cryptocurrency String after ssh_hassh;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS ssl_version String after ssl_sni;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS ssl_version String after ssl_sni;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS ssl_version String after ssl_sni;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_san;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_san;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_san;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS client_asn String after client_isp;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS client_asn String after client_isp;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS client_asn String after client_isp;

ALTER  table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS server_asn String after server_isp;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS server_asn String after server_isp;
ALTER  table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS server_asn String after server_isp;
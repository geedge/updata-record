set distributed_ddl_task_timeout = 180;

ALTER table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash  String after ssl_ja3_hash;


ALTER table tsg_galaxy_v3.session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.interim_session_record_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.interim_session_record on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint  String after ssl_ja3_hash;

ALTER table tsg_galaxy_v3.security_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after ssl_ja3_hash;
ALTER table tsg_galaxy_v3.security_event on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint  String after ssl_ja3_hash;
set distributed_ddl_task_timeout = 180;


ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_error String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_error String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_error String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_cert_verify Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_cert_verify Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_cert_verify Int64 after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_client_side_version String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_client_side_version String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_client_side_version String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_server_side_version String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_server_side_version String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_server_side_version String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_client_side_latency Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_client_side_latency Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_client_side_latency Int64 after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_server_side_latency Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_server_side_latency Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_server_side_latency Int64 after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_passthrough_reason String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_passthrough_reason String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_passthrough_reason String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_status Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_status Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_status Int64 after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS intercept_pinning_status Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS intercept_pinning_status Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS intercept_pinning_status Int64 after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_cert_subject String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_cert_subject String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_cert_subject String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_cert_issuer String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_cert_issuer String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_cert_issuer String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_hash String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_ja3s_hash String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3s_fingerprint String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_ja3s_fingerprint String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3_hash String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3_hash String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_ja3_hash String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_ja3_fingerprint String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_ja3_fingerprint String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_ja3_fingerprint String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_con_latency_ms Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_con_latency_ms Int64 after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_con_latency_ms Int64 after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_cn String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_cn String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_cn String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_san String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_san String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_san String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_sni String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_sni String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_sni String after rdp_cookie;

ALTER  table tsg_galaxy_v3.proxy_event_local on cluster ck_cluster add column IF NOT EXISTS ssl_version String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_cluster add column IF NOT EXISTS ssl_version String after rdp_cookie;
ALTER  table tsg_galaxy_v3.proxy_event on cluster ck_query add column IF NOT EXISTS ssl_version String after rdp_cookie;
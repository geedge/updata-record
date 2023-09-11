set distributed_ddl_task_timeout = 180;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS asymmetric_sessions Int64 after avg_ssl_con_latency_ms;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS asymmetric_sessions Int64 after avg_ssl_con_latency_ms;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS asymmetric_sessions Int64 after avg_ssl_con_latency_ms;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS bulky_sessions Int64 after asymmetric_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS bulky_sessions Int64 after asymmetric_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS bulky_sessions Int64 after asymmetric_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS cbr_streaming_sessions Int64 after bulky_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS cbr_streaming_sessions Int64 after bulky_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS cbr_streaming_sessions Int64 after bulky_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS download_sessions Int64 after cbr_streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS download_sessions Int64 after cbr_streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS download_sessions Int64 after cbr_streaming_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS interactive_sessions Int64 after download_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS interactive_sessions Int64 after download_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS interactive_sessions Int64 after download_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS pseudo_unidirectional_sessions Int64 after interactive_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS pseudo_unidirectional_sessions Int64 after interactive_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS pseudo_unidirectional_sessions Int64 after interactive_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS streaming_sessions Int64 after pseudo_unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS streaming_sessions Int64 after pseudo_unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS streaming_sessions Int64 after pseudo_unidirectional_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS unidirectional_sessions Int64 after streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS unidirectional_sessions Int64 after streaming_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS unidirectional_sessions Int64 after streaming_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS random_looking_sessions Int64 after unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS random_looking_sessions Int64 after unidirectional_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS random_looking_sessions Int64 after unidirectional_sessions;

ALTER table cyber_narrator_galaxy.metric_ip_local on cluster ck_cluster add column IF NOT EXISTS bidirectional_sessions Int64 after random_looking_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_cluster add column IF NOT EXISTS bidirectional_sessions Int64 after random_looking_sessions;
ALTER table cyber_narrator_galaxy.metric_ip on cluster ck_query add column IF NOT EXISTS bidirectional_sessions Int64 after random_looking_sessions;

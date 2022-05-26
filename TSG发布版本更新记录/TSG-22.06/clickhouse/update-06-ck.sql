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


alter table tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster add column  ssl_passthrough_reason String after ssl_intercept_state;
alter table tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster add column  ssl_passthrough_reason String after ssl_intercept_state;
alter table tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query add column  ssl_passthrough_reason String after ssl_intercept_state;

alter table tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster add column  ssl_passthrough_reason String after ssl_intercept_state;
alter table tsg_galaxy_v3.session_record ON CLUSTER ck_cluster add column  ssl_passthrough_reason String after ssl_intercept_state;
alter table tsg_galaxy_v3.session_record ON CLUSTER ck_query add column  ssl_passthrough_reason String after ssl_intercept_state;

alter table tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster add column  ssl_passthrough_reason String after ssl_intercept_state;
alter table tsg_galaxy_v3.security_event ON CLUSTER ck_cluster add column  ssl_passthrough_reason String after ssl_intercept_state;
alter table tsg_galaxy_v3.security_event ON CLUSTER ck_query add column  ssl_passthrough_reason String after ssl_intercept_state;



alter table tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;

alter table tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.session_record ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.session_record ON CLUSTER ck_query add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;

alter table tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.security_event ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.security_event ON CLUSTER ck_query add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;

alter table tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster add column IF NOT EXISTS  sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.transaction_record ON CLUSTER ck_query add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;

alter table tsg_galaxy_v3.voip_record_local ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.voip_record ON CLUSTER ck_cluster add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;
alter table tsg_galaxy_v3.voip_record ON CLUSTER ck_query add column IF NOT EXISTS sip_duration_s Int64 after sip_responder_sdp_content;


alter table tsg_galaxy_v3.interim_session_record_local ON CLUSTER ck_cluster drop column IF EXISTS sip_duration;
alter table tsg_galaxy_v3.interim_session_record ON CLUSTER ck_cluster drop column IF EXISTS sip_duration;
alter table tsg_galaxy_v3.interim_session_record ON CLUSTER ck_query drop column IF EXISTS sip_duration;

alter table tsg_galaxy_v3.session_record_local ON CLUSTER ck_cluster drop column IF EXISTS sip_duration;
alter table tsg_galaxy_v3.session_record ON CLUSTER ck_cluster drop column IF EXISTS sip_duration;
alter table tsg_galaxy_v3.session_record ON CLUSTER ck_query drop column IF EXISTS sip_duration;

alter table tsg_galaxy_v3.security_event_local ON CLUSTER ck_cluster drop column  IF EXISTS sip_duration;
alter table tsg_galaxy_v3.security_event ON CLUSTER ck_cluster drop column IF EXISTS  sip_duration;
alter table tsg_galaxy_v3.security_event ON CLUSTER ck_query drop column IF EXISTS  sip_duration;

alter table tsg_galaxy_v3.transaction_record_local ON CLUSTER ck_cluster drop column IF EXISTS  sip_duration;
alter table tsg_galaxy_v3.transaction_record ON CLUSTER ck_cluster drop column IF EXISTS  sip_duration;
alter table tsg_galaxy_v3.transaction_record ON CLUSTER ck_query drop column IF EXISTS  sip_duration;

alter table tsg_galaxy_v3.voip_record_local ON CLUSTER ck_cluster drop column IF EXISTS sip_duration;
alter table tsg_galaxy_v3.voip_record ON CLUSTER ck_cluster drop column IF EXISTS  sip_duration;
alter table tsg_galaxy_v3.voip_record ON CLUSTER ck_query drop column IF EXISTS  sip_duration;



CREATE TABLE IF NOT EXISTS  tsg_galaxy_v3.assessment_event_local ON CLUSTER ck_cluster
(
    common_log_id UInt64,
    common_recv_time Int64,
    assessment_date Int64,
    lot_number String,
    file_name String,
    assessment_file String,
    assessment_type String,
    features String,
    size Int64,
    file_checksum_sha String
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(toDate(common_recv_time))
ORDER BY (common_log_id,
 common_recv_time)

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.assessment_event ON CLUSTER ck_cluster
(
    common_log_id UInt64,
    common_recv_time Int64,
    assessment_date Int64,
    lot_number String,
    file_name String,
    assessment_file String,
    assessment_type String,
    features String,
    size Int64,
    file_checksum_sha String
)
ENGINE = Distributed('ck_cluster',
 'tsg_galaxy_v3',
 'assessment_event_local',
 rand());

CREATE TABLE IF NOT EXISTS tsg_galaxy_v3.assessment_event ON CLUSTER ck_query
(
    common_log_id UInt64,
    common_recv_time Int64,
    assessment_date Int64,
    lot_number String,
    file_name String,
    assessment_file String,
    assessment_type String,
    features String,
    size Int64,
    file_checksum_sha String
)
ENGINE = Distributed('ck_cluster',
 'tsg_galaxy_v3',
 'assessment_event_local',
 rand());

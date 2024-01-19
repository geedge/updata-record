#!/bin/bash

# 本脚本逐时间段按最新往前顺序迁移clickhouse数据，TSG23.11日志重组后数据迁移

# 迁移表 参数，可选值：session_record，security_event，monitor_event，transaction_record，voip_record，proxy_event，dos_event
table=$1
# 数据开始时间(UTC) 参数
data_start_time=$2
# 数据结束时间(UTC) 参数
data_end_time=$3
# 每批迁移数据时间段长度(分钟) 参数
slice_interval_minute=$4

timestamp_start=`date --utc --date="$data_start_time" +%s`
timestamp_end=`date --utc --date="$data_end_time" +%s`

# 需要迁移的表名称
session_record_table_src="tsg_galaxy_v3.session_record_local_old"
session_record_table_dest="tsg_galaxy_v3.session_record_local"

security_event_table_src="tsg_galaxy_v3.security_event_local_old"
security_event_table_dest="tsg_galaxy_v3.security_event_local"

monitor_event_table_src="tsg_galaxy_v3.security_event_local_old"
monitor_event_table_dest="tsg_galaxy_v3.monitor_event_local"

transaction_record_table_src="tsg_galaxy_v3.transaction_record_local_old"
transaction_record_table_dest="tsg_galaxy_v3.transaction_record_local"

voip_record_table_src="tsg_galaxy_v3.voip_record_local_old"
voip_record_table_dest="tsg_galaxy_v3.voip_record_local"

proxy_event_table_src="tsg_galaxy_v3.proxy_event_local_old"
proxy_event_table_dest="tsg_galaxy_v3.proxy_event_local"

dos_event_table_src="tsg_galaxy_v3.dos_event_local_old"
dos_event_table_dest="tsg_galaxy_v3.dos_event_local"

# ck客户端参数
ip="127.0.0.1"
ck_port="9001"
ck_username="default"
ck_password="galaxy2019"
ck_max_execution_time=36000 # 执行insert 的超时时间秒
max_threads=2 # max_insert_threads和max_threads

# 校验时间参数
if [ -z "$timestamp_start" ]; then
    echo "data_start_time fmt err"
    exit 1
fi

if [ -z "$timestamp_end" ]; then
    echo "data_end_time fmt err"
    exit 1
fi

if [ $timestamp_start -ge $timestamp_end ]; then
    echo "date range err"
    exit 1
fi

echo "#####################start `date --utc +'%Y-%m-%d %H:%M:%S'`#######################"
echo "输入参数: table:$table"
echo "输入参数: data_start_time:$data_start_time($timestamp_start)"
echo "输入参数: data_end_time:$data_end_time($timestamp_end)"

insert_success_cnt=0
insert_fail_cnt=0

migrate_session_record_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $session_record_table_dest
(
    recv_time,
    log_id,
    decoded_as,
    session_id,
    start_timestamp_ms,
    end_timestamp_ms,
    duration_ms,
    tcp_handshake_latency_ms,
    ingestion_time,
    processing_time,
    -- insert_time,
    device_id,
    out_link_id,
    in_link_id,
    device_tag,
    data_center,
    device_group,
    sled_ip,
    address_type,
    vsys_id,
    t_vsys_id,
    flags,
    flags_identify_info,
    -- security_rule_list,
    -- security_action,
    -- monitor_rule_list,
    shaping_rule_list,
    -- proxy_rule_list,
    -- statistics_rule_list,
    -- sc_rule_list,
    -- sc_rsp_raw,
    -- sc_rsp_decrypted,
    -- proxy_action,
    -- proxy_pinning_status,
    -- proxy_intercept_status,
    -- proxy_passthrough_reason,
    -- proxy_client_side_latency_ms,
    -- proxy_server_side_latency_ms,
    -- proxy_client_side_version,
    -- proxy_server_side_version,
    -- proxy_cert_verify,
    -- proxy_intercept_error,
    monitor_mirrored_pkts,
    monitor_mirrored_bytes,
    client_ip,
    client_port,
    client_os_desc,
    client_geolocation,
    client_asn,
    subscriber_id,
    imei,
    imsi,
    phone_number,
    -- apn,
    server_ip,
    server_port,
    server_os_desc,
    server_geolocation,
    server_asn,
    server_fqdn,
    server_domain,
    app_transition,
    app,
    -- app_debug_info,
    -- app_content,
    fqdn_category_list,
    -- ip_protocol,
    decoded_path,
    dns_message_id,
    dns_qr,
    dns_opcode,
    dns_aa,
    dns_tc,
    dns_rd,
    dns_ra,
    dns_rcode,
    dns_qdcount,
    dns_ancount,
    dns_nscount,
    dns_arcount,
    dns_qname,
    dns_qtype,
    dns_qclass,
    dns_cname,
    dns_sub,
    dns_rr,
    dns_response_latency_ms,
    http_url,
    http_host,
    http_request_line,
    http_response_line,
    http_request_body,
    http_response_body,
    http_proxy_flag,
    http_sequence,
    http_cookie,
    http_referer,
    http_user_agent,
    http_request_content_length,
    http_request_content_type,
    http_response_content_length,
    http_response_content_type,
    http_set_cookie,
    http_version,
    http_status_code,
    http_response_latency_ms,
    http_session_duration_ms,
    http_action_file_size,
    ssl_version,
    ssl_sni,
    ssl_san,
    ssl_cn,
    ssl_handshake_latency_ms,
    ssl_ja3_hash,
    ssl_ja3s_hash,
    ssl_cert_issuer,
    ssl_cert_subject,
    ssl_esni_flag,
    ssl_ech_flag,
    dtls_cookie,
    dtls_version,
    dtls_sni,
    dtls_san,
    dtls_cn,
    dtls_handshake_latency_ms,
    dtls_ja3_fingerprint,
    dtls_ja3_hash,
    dtls_cert_issuer,
    dtls_cert_subject,
    mail_protocol_type,
    mail_account,
    mail_from_cmd,
    mail_to_cmd,
    mail_from,
    -- mail_password,
    mail_to,
    mail_cc,
    mail_bcc,
    mail_subject,
    mail_subject_charset,
    mail_attachment_name,
    mail_attachment_name_charset,
    mail_eml_file,
    ftp_account,
    ftp_url,
    ftp_link_type,
    quic_version,
    quic_sni,
    quic_user_agent,
    rdp_cookie,
    rdp_security_protocol,
    rdp_client_channels,
    rdp_keyboard_layout,
    rdp_client_version,
    rdp_client_name,
    rdp_client_product_id,
    rdp_desktop_width,
    rdp_desktop_height,
    rdp_requested_color_depth,
    rdp_certificate_type,
    rdp_certificate_count,
    rdp_certificate_permanent,
    rdp_encryption_level,
    rdp_encryption_method,
    ssh_version,
    ssh_auth_success,
    ssh_client_version,
    ssh_server_version,
    ssh_cipher_alg,
    ssh_mac_alg,
    ssh_compression_alg,
    ssh_kex_alg,
    ssh_host_key_alg,
    ssh_host_key,
    ssh_hassh,
    sip_call_id,
    sip_originator_description,
    sip_responder_description,
    sip_user_agent,
    sip_server,
    sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port,
    sip_originator_sdp_media_type,
    sip_originator_sdp_content,
    sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port,
    sip_responder_sdp_media_type,
    sip_responder_sdp_content,
    sip_duration_s,
    sip_bye,
    rtp_payload_type_c2s,
    rtp_payload_type_s2c,
    rtp_pcap_path,
    rtp_originator_dir,
    stratum_cryptocurrency,
    stratum_mining_pools,
    stratum_mining_program,
    -- stratum_mining_subscribe,
    sent_pkts,
    received_pkts,
    sent_bytes,
    received_bytes,
    tcp_c2s_ip_fragments,
    tcp_s2c_ip_fragments,
    tcp_c2s_lost_bytes,
    tcp_s2c_lost_bytes,
    tcp_c2s_o3_pkts,
    tcp_s2c_o3_pkts,
    tcp_c2s_rtx_pkts,
    tcp_s2c_rtx_pkts,
    tcp_c2s_rtx_bytes,
    tcp_s2c_rtx_bytes,
    tcp_rtt_ms,
    tcp_client_isn,
    tcp_server_isn,
    packet_capture_file,
    in_src_mac,
    out_src_mac,
    in_dest_mac,
    out_dest_mac,
    tunnels,
    dup_traffic_flag,
    tunnel_endpoint_a_desc,
    tunnel_endpoint_b_desc
)
SELECT
    common_recv_time as recv_time,
    common_log_id as log_id,
    common_schema_type as decoded_as,
    common_stream_trace_id as session_id,
    common_start_timestamp_ms as start_timestamp_ms,
    common_end_timestamp_ms as end_timestamp_ms,
    common_con_duration_ms as duration_ms,
    common_establish_latency_ms as tcp_handshake_latency_ms,
    common_ingestion_time as ingestion_time,
    common_processing_time as processing_time,
    -- common_insert_time as insert_time,
    common_device_id as device_id,
    common_out_link_id as out_link_id,
    common_in_link_id as in_link_id,
    common_device_tag as device_tag,
    common_data_center as data_center,
    common_device_group as device_group,
    common_sled_ip as sled_ip,
    common_address_type as address_type,
    common_vsys_id as vsys_id,
    common_t_vsys_id as t_vsys_id,
    common_flags as flags,
    common_flags_identify_info as flags_identify_info,
    -- as security_rule_list,
    -- as security_action,
    -- as monitor_rule_list,
    common_shaping_rule_ids as shaping_rule_list,
    -- as proxy_rule_list,
    -- as statistics_rule_list,
    -- as sc_rule_list,
    -- as sc_rsp_raw,
    -- as sc_rsp_decrypted,
    -- as proxy_action,
    -- as proxy_pinning_status,
    -- as proxy_intercept_status,
    -- as proxy_passthrough_reason,
    -- as proxy_client_side_latency_ms,
    -- as proxy_server_side_latency_ms,
    -- as proxy_client_side_version,
    -- as proxy_server_side_version,
    -- as proxy_cert_verify,
    -- as proxy_intercept_error,
    common_mirrored_pkts as monitor_mirrored_pkts,
    common_mirrored_bytes as monitor_mirrored_bytes,
    common_client_ip as client_ip,
    common_client_port as client_port,
    common_client_os_name as client_os_desc,
    common_client_location as client_geolocation,
    common_client_asn as client_asn,
    common_subscriber_id as subscriber_id,
    common_imei as imei,
    common_imsi as imsi,
    common_phone_number as phone_number,
    -- as apn,
    common_server_ip as server_ip,
    common_server_port as server_port,
    common_server_os_name as server_os_desc,
    common_server_location as server_geolocation,
    common_server_asn as server_asn,
    common_server_fqdn as server_fqdn,
    common_server_domain as server_domain,
    common_app_full_path as app_transition,
    common_app_label as app,
    -- app_debug_info,
    -- common_app_behavior as app_content,
    common_service_category as fqdn_category_list,
    -- ip_protocol,
    common_protocol_label as decoded_path,
    dns_message_id as dns_message_id,
    dns_qr as dns_qr,
    dns_opcode as dns_opcode,
    dns_aa as dns_aa,
    dns_tc as dns_tc,
    dns_rd as dns_rd,
    dns_ra as dns_ra,
    dns_rcode as dns_rcode,
    dns_qdcount as dns_qdcount,
    dns_ancount as dns_ancount,
    dns_nscount as dns_nscount,
    dns_arcount as dns_arcount,
    dns_qname as dns_qname,
    dns_qtype as dns_qtype,
    dns_qclass as dns_qclass,
    dns_cname as dns_cname,
    dns_sub as dns_sub,
    dns_rr as dns_rr,
    dns_response_latency_ms as dns_response_latency_ms,
    http_url as http_url,
    http_host as http_host,
    http_request_line as http_request_line,
    http_response_line as http_response_line,
    http_request_body as http_request_body,
    http_response_body as http_response_body,
    http_proxy_flag as http_proxy_flag,
    http_sequence as http_sequence,
    http_cookie as http_cookie,
    http_referer as http_referer,
    http_user_agent as http_user_agent,
    http_request_content_length as http_request_content_length,
    http_request_content_type as http_request_content_type,
    http_response_content_length as http_response_content_length,
    http_response_content_type as http_response_content_type,
    http_set_cookie as http_set_cookie,
    http_version as http_version,
    http_status_code as http_status_code,
    http_response_latency_ms as http_response_latency_ms,
    http_session_duration_ms as http_session_duration_ms,
    http_action_file_size as http_action_file_size,
    ssl_version as ssl_version,
    ssl_sni as ssl_sni,
    ssl_san as ssl_san,
    ssl_cn as ssl_cn,
    ssl_con_latency_ms as ssl_handshake_latency_ms,
    ssl_ja3_hash as ssl_ja3_hash,
    ssl_ja3s_hash as ssl_ja3s_hash,
    ssl_cert_issuer as ssl_cert_issuer,
    ssl_cert_subject as ssl_cert_subject,
    ssl_esni_flag as ssl_esni_flag,
    ssl_ech_flag as ssl_ech_flag,
    dtls_cookie as dtls_cookie,
    dtls_version as dtls_version,
    dtls_sni as dtls_sni,
    dtls_san as dtls_san,
    dtls_cn as dtls_cn,
    dtls_con_latency_ms as dtls_handshake_latency_ms,
    dtls_ja3_fingerprint as dtls_ja3_fingerprint,
    dtls_ja3_hash as dtls_ja3_hash,
    dtls_cert_issuer as dtls_cert_issuer,
    dtls_cert_subject as dtls_cert_subject,
    mail_protocol_type as mail_protocol_type,
    mail_account as mail_account,
    mail_from_cmd as mail_from_cmd,
    mail_to_cmd as mail_to_cmd,
    mail_from as mail_from,
    -- as mail_password,
    mail_to as mail_to,
    mail_cc as mail_cc,
    mail_bcc as mail_bcc,
    mail_subject as mail_subject,
    mail_subject_charset as mail_subject_charset,
    mail_attachment_name as mail_attachment_name,
    mail_attachment_name_charset as mail_attachment_name_charset,
    mail_eml_file as mail_eml_file,
    ftp_account as ftp_account,
    ftp_url as ftp_url,
    ftp_link_type as ftp_link_type,
    quic_version as quic_version,
    quic_sni as quic_sni,
    quic_user_agent as quic_user_agent,
    rdp_cookie as rdp_cookie,
    rdp_security_protocol as rdp_security_protocol,
    rdp_client_channels as rdp_client_channels,
    rdp_keyboard_layout as rdp_keyboard_layout,
    rdp_client_version as rdp_client_version,
    rdp_client_name as rdp_client_name,
    rdp_client_product_id as rdp_client_product_id,
    rdp_desktop_width as rdp_desktop_width,
    rdp_desktop_height as rdp_desktop_height,
    rdp_requested_color_depth as rdp_requested_color_depth,
    rdp_certificate_type as rdp_certificate_type,
    rdp_certificate_count as rdp_certificate_count,
    rdp_certificate_permanent as rdp_certificate_permanent,
    rdp_encryption_level as rdp_encryption_level,
    rdp_encryption_method as rdp_encryption_method,
    ssh_version as ssh_version,
    ssh_auth_success as ssh_auth_success,
    ssh_client_version as ssh_client_version,
    ssh_server_version as ssh_server_version,
    ssh_cipher_alg as ssh_cipher_alg,
    ssh_mac_alg as ssh_mac_alg,
    ssh_compression_alg as ssh_compression_alg,
    ssh_kex_alg as ssh_kex_alg,
    ssh_host_key_alg as ssh_host_key_alg,
    ssh_host_key as ssh_host_key,
    ssh_hassh as ssh_hassh,
    sip_call_id as sip_call_id,
    sip_originator_description as sip_originator_description,
    sip_responder_description as sip_responder_description,
    sip_user_agent as sip_user_agent,
    sip_server as sip_server,
    sip_originator_sdp_connect_ip as sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port as sip_originator_sdp_media_port,
    sip_originator_sdp_media_type as sip_originator_sdp_media_type,
    sip_originator_sdp_content as sip_originator_sdp_content,
    sip_responder_sdp_connect_ip as sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port as sip_responder_sdp_media_port,
    sip_responder_sdp_media_type as sip_responder_sdp_media_type,
    sip_responder_sdp_content as sip_responder_sdp_content,
    sip_duration_s as sip_duration_s,
    sip_bye as sip_bye,
    rtp_payload_type_c2s as rtp_payload_type_c2s,
    rtp_payload_type_s2c as rtp_payload_type_s2c,
    rtp_pcap_path as rtp_pcap_path,
    rtp_originator_dir as rtp_originator_dir,
    stratum_cryptocurrency as stratum_cryptocurrency,
    stratum_mining_pools as stratum_mining_pools,
    stratum_mining_program as stratum_mining_program,
    -- as stratum_mining_subscribe,
    common_c2s_pkt_num as sent_pkts,
    common_s2c_pkt_num as received_pkts,
    common_c2s_byte_num as sent_bytes,
    common_s2c_byte_num as received_bytes,
    common_c2s_ipfrag_num as tcp_c2s_ip_fragments,
    common_s2c_ipfrag_num as tcp_s2c_ip_fragments,
    common_c2s_tcp_lostlen as tcp_c2s_lost_bytes,
    common_s2c_tcp_lostlen as tcp_s2c_lost_bytes,
    common_c2s_tcp_unorder_num as tcp_c2s_o3_pkts,
    common_s2c_tcp_unorder_num as tcp_s2c_o3_pkts,
    common_c2s_pkt_retrans as tcp_c2s_rtx_pkts,
    common_s2c_pkt_retrans as tcp_s2c_rtx_pkts,
    common_c2s_byte_retrans as tcp_c2s_rtx_bytes,
    common_s2c_byte_retrans as tcp_s2c_rtx_bytes,
    common_first_ttl as tcp_rtt_ms,
    common_tcp_client_isn as tcp_client_isn,
    common_tcp_server_isn as tcp_server_isn,
    common_packet_capture_file as packet_capture_file,
    common_in_src_mac as in_src_mac,
    common_out_src_mac as out_src_mac,
    common_in_dest_mac as in_dest_mac,
    common_out_dest_mac as out_dest_mac,
    common_tunnels as tunnels,
    common_has_dup_traffic as dup_traffic_flag,
    common_tunnel_endpoint_a_desc as tunnel_endpoint_a_desc,
    common_tunnel_endpoint_b_desc as tunnel_endpoint_b_desc
FROM $session_record_table_src
where common_recv_time >= $input_time_start and common_recv_time < $input_time_end
;"
    # echo "sql:$session_record_table_src => $session_record_table_dest where common_recv_time >= $input_time_start and common_recv_time < $input_time_end"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_security_event_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $security_event_table_dest
(
    recv_time,
    log_id,
    decoded_as,
    session_id,
    start_timestamp_ms,
    end_timestamp_ms,
    duration_ms,
    tcp_handshake_latency_ms,
    ingestion_time,
    processing_time,
    -- insert_time,
    device_id,
    out_link_id,
    in_link_id,
    device_tag,
    data_center,
    device_group,
    sled_ip,
    address_type,
    vsys_id,
    t_vsys_id,
    flags,
    flags_identify_info,
    security_rule_list,
    security_action,
    monitor_rule_list,
    shaping_rule_list,
    -- proxy_rule_list,
    -- statistics_rule_list,
    -- sc_rule_list,
    -- sc_rsp_raw,
    -- sc_rsp_decrypted,
    -- proxy_action,
    -- proxy_pinning_status,
    -- proxy_intercept_status,
    -- proxy_passthrough_reason,
    -- proxy_client_side_latency_ms,
    -- proxy_server_side_latency_ms,
    -- proxy_client_side_version,
    -- proxy_server_side_version,
    -- proxy_cert_verify,
    -- proxy_intercept_error,
    monitor_mirrored_pkts,
    monitor_mirrored_bytes,
    client_ip,
    client_port,
    client_os_desc,
    client_geolocation,
    client_asn,
    subscriber_id,
    imei,
    imsi,
    phone_number,
    -- apn,
    server_ip,
    server_port,
    server_os_desc,
    server_geolocation,
    server_asn,
    server_fqdn,
    server_domain,
    app_transition,
    app,
    -- app_debug_info,
    -- app_content,
    fqdn_category_list,
    -- ip_protocol,
    decoded_path,
    dns_message_id,
    dns_qr,
    dns_opcode,
    dns_aa,
    dns_tc,
    dns_rd,
    dns_ra,
    dns_rcode,
    dns_qdcount,
    dns_ancount,
    dns_nscount,
    dns_arcount,
    dns_qname,
    dns_qtype,
    dns_qclass,
    dns_cname,
    dns_sub,
    dns_rr,
    dns_response_latency_ms,
    http_url,
    http_host,
    http_request_line,
    http_response_line,
    http_request_body,
    http_response_body,
    http_proxy_flag,
    http_sequence,
    http_cookie,
    http_referer,
    http_user_agent,
    http_request_content_length,
    http_request_content_type,
    http_response_content_length,
    http_response_content_type,
    http_set_cookie,
    http_version,
    http_status_code,
    http_response_latency_ms,
    http_session_duration_ms,
    http_action_file_size,
    ssl_version,
    ssl_sni,
    ssl_san,
    ssl_cn,
    ssl_handshake_latency_ms,
    ssl_ja3_hash,
    ssl_ja3s_hash,
    ssl_cert_issuer,
    ssl_cert_subject,
    ssl_esni_flag,
    ssl_ech_flag,
    dtls_cookie,
    dtls_version,
    dtls_sni,
    dtls_san,
    dtls_cn,
    dtls_handshake_latency_ms,
    dtls_ja3_fingerprint,
    dtls_ja3_hash,
    dtls_cert_issuer,
    dtls_cert_subject,
    mail_protocol_type,
    mail_account,
    mail_from_cmd,
    mail_to_cmd,
    mail_from,
    -- mail_password,
    mail_to,
    mail_cc,
    mail_bcc,
    mail_subject,
    mail_subject_charset,
    mail_attachment_name,
    mail_attachment_name_charset,
    mail_eml_file,
    ftp_account,
    ftp_url,
    ftp_link_type,
    quic_version,
    quic_sni,
    quic_user_agent,
    rdp_cookie,
    rdp_security_protocol,
    rdp_client_channels,
    rdp_keyboard_layout,
    rdp_client_version,
    rdp_client_name,
    rdp_client_product_id,
    rdp_desktop_width,
    rdp_desktop_height,
    rdp_requested_color_depth,
    rdp_certificate_type,
    rdp_certificate_count,
    rdp_certificate_permanent,
    rdp_encryption_level,
    rdp_encryption_method,
    ssh_version,
    ssh_auth_success,
    ssh_client_version,
    ssh_server_version,
    ssh_cipher_alg,
    ssh_mac_alg,
    ssh_compression_alg,
    ssh_kex_alg,
    ssh_host_key_alg,
    ssh_host_key,
    ssh_hassh,
    sip_call_id,
    sip_originator_description,
    sip_responder_description,
    sip_user_agent,
    sip_server,
    sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port,
    sip_originator_sdp_media_type,
    sip_originator_sdp_content,
    sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port,
    sip_responder_sdp_media_type,
    sip_responder_sdp_content,
    sip_duration_s,
    sip_bye,
    rtp_payload_type_c2s,
    rtp_payload_type_s2c,
    rtp_pcap_path,
    rtp_originator_dir,
    stratum_cryptocurrency,
    stratum_mining_pools,
    stratum_mining_program,
    -- stratum_mining_subscribe,
    sent_pkts,
    received_pkts,
    sent_bytes,
    received_bytes,
    tcp_c2s_ip_fragments,
    tcp_s2c_ip_fragments,
    tcp_c2s_lost_bytes,
    tcp_s2c_lost_bytes,
    tcp_c2s_o3_pkts,
    tcp_s2c_o3_pkts,
    tcp_c2s_rtx_pkts,
    tcp_s2c_rtx_pkts,
    tcp_c2s_rtx_bytes,
    tcp_s2c_rtx_bytes,
    tcp_rtt_ms,
    tcp_client_isn,
    tcp_server_isn,
    packet_capture_file,
    in_src_mac,
    out_src_mac,
    in_dest_mac,
    out_dest_mac,
    tunnels,
    dup_traffic_flag,
    tunnel_endpoint_a_desc,
    tunnel_endpoint_b_desc
)
SELECT
    common_recv_time as recv_time,
    common_log_id as log_id,
    common_schema_type as decoded_as,
    common_stream_trace_id as session_id,
    common_start_timestamp_ms as start_timestamp_ms,
    common_end_timestamp_ms as end_timestamp_ms,
    common_con_duration_ms as duration_ms,
    common_establish_latency_ms as tcp_handshake_latency_ms,
    common_ingestion_time as ingestion_time,
    common_processing_time as processing_time,
    -- common_insert_time as insert_time,
    common_device_id as device_id,
    common_out_link_id as out_link_id,
    common_in_link_id as in_link_id,
    common_device_tag as device_tag,
    common_data_center as data_center,
    common_device_group as device_group,
    common_sled_ip as sled_ip,
    common_address_type as address_type,
    common_vsys_id as vsys_id,
    common_t_vsys_id as t_vsys_id,
    common_flags as flags,
    common_flags_identify_info as flags_identify_info,
    if(common_action in (16, 96), array(common_policy_id), array()) as security_rule_list, -- in(Deny、Allow) array(common_policy_id) 安全表
    case common_action
        when 16 then 'Deny'
        when 96 then 'Allow'
        else ''
    end as security_action, -- Deny16、Allow96 else ''
    if(common_action = 1, array(common_policy_id), array()) as monitor_rule_list, -- 是Monitor(1) 放common_policy_id
    common_shaping_rule_ids as shaping_rule_list,
    -- as proxy_rule_list,
    -- as statistics_rule_list,
    -- as sc_rule_list,
    -- as sc_rsp_raw,
    -- as sc_rsp_decrypted,
    -- as proxy_action,
    -- as proxy_pinning_status,
    -- as proxy_intercept_status,
    -- as proxy_passthrough_reason,
    -- as proxy_client_side_latency_ms,
    -- as proxy_server_side_latency_ms,
    -- as proxy_client_side_version,
    -- as proxy_server_side_version,
    -- as proxy_cert_verify,
    -- as proxy_intercept_error,
    common_mirrored_pkts as monitor_mirrored_pkts,
    common_mirrored_bytes as monitor_mirrored_bytes,
    common_client_ip as client_ip,
    common_client_port as client_port,
    common_client_os_name as client_os_desc,
    common_client_location as client_geolocation,
    common_client_asn as client_asn,
    common_subscriber_id as subscriber_id,
    common_imei as imei,
    common_imsi as imsi,
    common_phone_number as phone_number,
    -- as apn,
    common_server_ip as server_ip,
    common_server_port as server_port,
    common_server_os_name as server_os_desc,
    common_server_location as server_geolocation,
    common_server_asn as server_asn,
    common_server_fqdn as server_fqdn,
    common_server_domain as server_domain,
    common_app_full_path as app_transition,
    common_app_label as app,
    -- app_debug_info,
    -- common_app_behavior as app_content,
    common_service_category as fqdn_category_list,
    -- ip_protocol,
    common_protocol_label as decoded_path,
    dns_message_id as dns_message_id,
    dns_qr as dns_qr,
    dns_opcode as dns_opcode,
    dns_aa as dns_aa,
    dns_tc as dns_tc,
    dns_rd as dns_rd,
    dns_ra as dns_ra,
    dns_rcode as dns_rcode,
    dns_qdcount as dns_qdcount,
    dns_ancount as dns_ancount,
    dns_nscount as dns_nscount,
    dns_arcount as dns_arcount,
    dns_qname as dns_qname,
    dns_qtype as dns_qtype,
    dns_qclass as dns_qclass,
    dns_cname as dns_cname,
    dns_sub as dns_sub,
    dns_rr as dns_rr,
    dns_response_latency_ms as dns_response_latency_ms,
    http_url as http_url,
    http_host as http_host,
    http_request_line as http_request_line,
    http_response_line as http_response_line,
    http_request_body as http_request_body,
    http_response_body as http_response_body,
    http_proxy_flag as http_proxy_flag,
    http_sequence as http_sequence,
    http_cookie as http_cookie,
    http_referer as http_referer,
    http_user_agent as http_user_agent,
    http_request_content_length as http_request_content_length,
    http_request_content_type as http_request_content_type,
    http_response_content_length as http_response_content_length,
    http_response_content_type as http_response_content_type,
    http_set_cookie as http_set_cookie,
    http_version as http_version,
    http_status_code as http_status_code,
    http_response_latency_ms as http_response_latency_ms,
    http_session_duration_ms as http_session_duration_ms,
    http_action_file_size as http_action_file_size,
    ssl_version as ssl_version,
    ssl_sni as ssl_sni,
    ssl_san as ssl_san,
    ssl_cn as ssl_cn,
    ssl_con_latency_ms as ssl_handshake_latency_ms,
    ssl_ja3_hash as ssl_ja3_hash,
    ssl_ja3s_hash as ssl_ja3s_hash,
    ssl_cert_issuer as ssl_cert_issuer,
    ssl_cert_subject as ssl_cert_subject,
    ssl_esni_flag as ssl_esni_flag,
    ssl_ech_flag as ssl_ech_flag,
    dtls_cookie as dtls_cookie,
    dtls_version as dtls_version,
    dtls_sni as dtls_sni,
    dtls_san as dtls_san,
    dtls_cn as dtls_cn,
    dtls_con_latency_ms as dtls_handshake_latency_ms,
    dtls_ja3_fingerprint as dtls_ja3_fingerprint,
    dtls_ja3_hash as dtls_ja3_hash,
    dtls_cert_issuer as dtls_cert_issuer,
    dtls_cert_subject as dtls_cert_subject,
    mail_protocol_type as mail_protocol_type,
    mail_account as mail_account,
    mail_from_cmd as mail_from_cmd,
    mail_to_cmd as mail_to_cmd,
    mail_from as mail_from,
    -- as mail_password,
    mail_to as mail_to,
    mail_cc as mail_cc,
    mail_bcc as mail_bcc,
    mail_subject as mail_subject,
    mail_subject_charset as mail_subject_charset,
    mail_attachment_name as mail_attachment_name,
    mail_attachment_name_charset as mail_attachment_name_charset,
    mail_eml_file as mail_eml_file,
    ftp_account as ftp_account,
    ftp_url as ftp_url,
    ftp_link_type as ftp_link_type,
    quic_version as quic_version,
    quic_sni as quic_sni,
    quic_user_agent as quic_user_agent,
    rdp_cookie as rdp_cookie,
    rdp_security_protocol as rdp_security_protocol,
    rdp_client_channels as rdp_client_channels,
    rdp_keyboard_layout as rdp_keyboard_layout,
    rdp_client_version as rdp_client_version,
    rdp_client_name as rdp_client_name,
    rdp_client_product_id as rdp_client_product_id,
    rdp_desktop_width as rdp_desktop_width,
    rdp_desktop_height as rdp_desktop_height,
    rdp_requested_color_depth as rdp_requested_color_depth,
    rdp_certificate_type as rdp_certificate_type,
    rdp_certificate_count as rdp_certificate_count,
    rdp_certificate_permanent as rdp_certificate_permanent,
    rdp_encryption_level as rdp_encryption_level,
    rdp_encryption_method as rdp_encryption_method,
    ssh_version as ssh_version,
    ssh_auth_success as ssh_auth_success,
    ssh_client_version as ssh_client_version,
    ssh_server_version as ssh_server_version,
    ssh_cipher_alg as ssh_cipher_alg,
    ssh_mac_alg as ssh_mac_alg,
    ssh_compression_alg as ssh_compression_alg,
    ssh_kex_alg as ssh_kex_alg,
    ssh_host_key_alg as ssh_host_key_alg,
    ssh_host_key as ssh_host_key,
    ssh_hassh as ssh_hassh,
    sip_call_id as sip_call_id,
    sip_originator_description as sip_originator_description,
    sip_responder_description as sip_responder_description,
    sip_user_agent as sip_user_agent,
    sip_server as sip_server,
    sip_originator_sdp_connect_ip as sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port as sip_originator_sdp_media_port,
    sip_originator_sdp_media_type as sip_originator_sdp_media_type,
    sip_originator_sdp_content as sip_originator_sdp_content,
    sip_responder_sdp_connect_ip as sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port as sip_responder_sdp_media_port,
    sip_responder_sdp_media_type as sip_responder_sdp_media_type,
    sip_responder_sdp_content as sip_responder_sdp_content,
    sip_duration_s as sip_duration_s,
    sip_bye as sip_bye,
    rtp_payload_type_c2s as rtp_payload_type_c2s,
    rtp_payload_type_s2c as rtp_payload_type_s2c,
    rtp_pcap_path as rtp_pcap_path,
    rtp_originator_dir as rtp_originator_dir,
    stratum_cryptocurrency as stratum_cryptocurrency,
    stratum_mining_pools as stratum_mining_pools,
    stratum_mining_program as stratum_mining_program,
    -- as stratum_mining_subscribe,
    common_c2s_pkt_num as sent_pkts,
    common_s2c_pkt_num as received_pkts,
    common_c2s_byte_num as sent_bytes,
    common_s2c_byte_num as received_bytes,
    common_c2s_ipfrag_num as tcp_c2s_ip_fragments,
    common_s2c_ipfrag_num as tcp_s2c_ip_fragments,
    common_c2s_tcp_lostlen as tcp_c2s_lost_bytes,
    common_s2c_tcp_lostlen as tcp_s2c_lost_bytes,
    common_c2s_tcp_unorder_num as tcp_c2s_o3_pkts,
    common_s2c_tcp_unorder_num as tcp_s2c_o3_pkts,
    common_c2s_pkt_retrans as tcp_c2s_rtx_pkts,
    common_s2c_pkt_retrans as tcp_s2c_rtx_pkts,
    common_c2s_byte_retrans as tcp_c2s_rtx_bytes,
    common_s2c_byte_retrans as tcp_s2c_rtx_bytes,
    common_first_ttl as tcp_rtt_ms,
    common_tcp_client_isn as tcp_client_isn,
    common_tcp_server_isn as tcp_server_isn,
    common_packet_capture_file as packet_capture_file,
    common_in_src_mac as in_src_mac,
    common_out_src_mac as out_src_mac,
    common_in_dest_mac as in_dest_mac,
    common_out_dest_mac as out_dest_mac,
    common_tunnels as tunnels,
    common_has_dup_traffic as dup_traffic_flag,
    common_tunnel_endpoint_a_desc as tunnel_endpoint_a_desc,
    common_tunnel_endpoint_b_desc as tunnel_endpoint_b_desc
FROM $security_event_table_src
where common_recv_time >= $input_time_start and common_recv_time < $input_time_end
    and common_action in (16, 96)
;"
    # echo "sql:$security_event_table_src => $security_event_table_dest where common_recv_time >= $input_time_start and common_recv_time < $input_time_end"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_monitor_event_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $monitor_event_table_dest
(
    recv_time,
    log_id,
    decoded_as,
    session_id,
    start_timestamp_ms,
    end_timestamp_ms,
    duration_ms,
    tcp_handshake_latency_ms,
    ingestion_time,
    processing_time,
    -- insert_time,
    device_id,
    out_link_id,
    in_link_id,
    device_tag,
    data_center,
    device_group,
    sled_ip,
    address_type,
    vsys_id,
    t_vsys_id,
    flags,
    flags_identify_info,
    security_rule_list,
    security_action,
    monitor_rule_list,
    shaping_rule_list,
    -- proxy_rule_list,
    -- statistics_rule_list,
    -- sc_rule_list,
    -- sc_rsp_raw,
    -- sc_rsp_decrypted,
    -- proxy_action,
    -- proxy_pinning_status,
    -- proxy_intercept_status,
    -- proxy_passthrough_reason,
    -- proxy_client_side_latency_ms,
    -- proxy_server_side_latency_ms,
    -- proxy_client_side_version,
    -- proxy_server_side_version,
    -- proxy_cert_verify,
    -- proxy_intercept_error,
    monitor_mirrored_pkts,
    monitor_mirrored_bytes,
    client_ip,
    client_port,
    client_os_desc,
    client_geolocation,
    client_asn,
    subscriber_id,
    imei,
    imsi,
    phone_number,
    -- apn,
    server_ip,
    server_port,
    server_os_desc,
    server_geolocation,
    server_asn,
    server_fqdn,
    server_domain,
    app_transition,
    app,
    -- app_debug_info,
    -- app_content,
    fqdn_category_list,
    -- ip_protocol,
    decoded_path,
    dns_message_id,
    dns_qr,
    dns_opcode,
    dns_aa,
    dns_tc,
    dns_rd,
    dns_ra,
    dns_rcode,
    dns_qdcount,
    dns_ancount,
    dns_nscount,
    dns_arcount,
    dns_qname,
    dns_qtype,
    dns_qclass,
    dns_cname,
    dns_sub,
    dns_rr,
    dns_response_latency_ms,
    http_url,
    http_host,
    http_request_line,
    http_response_line,
    http_request_body,
    http_response_body,
    http_proxy_flag,
    http_sequence,
    http_cookie,
    http_referer,
    http_user_agent,
    http_request_content_length,
    http_request_content_type,
    http_response_content_length,
    http_response_content_type,
    http_set_cookie,
    http_version,
    http_status_code,
    http_response_latency_ms,
    http_session_duration_ms,
    http_action_file_size,
    ssl_version,
    ssl_sni,
    ssl_san,
    ssl_cn,
    ssl_handshake_latency_ms,
    ssl_ja3_hash,
    ssl_ja3s_hash,
    ssl_cert_issuer,
    ssl_cert_subject,
    ssl_esni_flag,
    ssl_ech_flag,
    dtls_cookie,
    dtls_version,
    dtls_sni,
    dtls_san,
    dtls_cn,
    dtls_handshake_latency_ms,
    dtls_ja3_fingerprint,
    dtls_ja3_hash,
    dtls_cert_issuer,
    dtls_cert_subject,
    mail_protocol_type,
    mail_account,
    mail_from_cmd,
    mail_to_cmd,
    mail_from,
    -- mail_password,
    mail_to,
    mail_cc,
    mail_bcc,
    mail_subject,
    mail_subject_charset,
    mail_attachment_name,
    mail_attachment_name_charset,
    mail_eml_file,
    ftp_account,
    ftp_url,
    ftp_link_type,
    quic_version,
    quic_sni,
    quic_user_agent,
    rdp_cookie,
    rdp_security_protocol,
    rdp_client_channels,
    rdp_keyboard_layout,
    rdp_client_version,
    rdp_client_name,
    rdp_client_product_id,
    rdp_desktop_width,
    rdp_desktop_height,
    rdp_requested_color_depth,
    rdp_certificate_type,
    rdp_certificate_count,
    rdp_certificate_permanent,
    rdp_encryption_level,
    rdp_encryption_method,
    ssh_version,
    ssh_auth_success,
    ssh_client_version,
    ssh_server_version,
    ssh_cipher_alg,
    ssh_mac_alg,
    ssh_compression_alg,
    ssh_kex_alg,
    ssh_host_key_alg,
    ssh_host_key,
    ssh_hassh,
    sip_call_id,
    sip_originator_description,
    sip_responder_description,
    sip_user_agent,
    sip_server,
    sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port,
    sip_originator_sdp_media_type,
    sip_originator_sdp_content,
    sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port,
    sip_responder_sdp_media_type,
    sip_responder_sdp_content,
    sip_duration_s,
    sip_bye,
    rtp_payload_type_c2s,
    rtp_payload_type_s2c,
    rtp_pcap_path,
    rtp_originator_dir,
    stratum_cryptocurrency,
    stratum_mining_pools,
    stratum_mining_program,
    -- stratum_mining_subscribe,
    sent_pkts,
    received_pkts,
    sent_bytes,
    received_bytes,
    tcp_c2s_ip_fragments,
    tcp_s2c_ip_fragments,
    tcp_c2s_lost_bytes,
    tcp_s2c_lost_bytes,
    tcp_c2s_o3_pkts,
    tcp_s2c_o3_pkts,
    tcp_c2s_rtx_pkts,
    tcp_s2c_rtx_pkts,
    tcp_c2s_rtx_bytes,
    tcp_s2c_rtx_bytes,
    tcp_rtt_ms,
    tcp_client_isn,
    tcp_server_isn,
    packet_capture_file,
    in_src_mac,
    out_src_mac,
    in_dest_mac,
    out_dest_mac,
    tunnels,
    dup_traffic_flag,
    tunnel_endpoint_a_desc,
    tunnel_endpoint_b_desc
)
SELECT
    common_recv_time as recv_time,
    common_log_id as log_id,
    common_schema_type as decoded_as,
    common_stream_trace_id as session_id,
    common_start_timestamp_ms as start_timestamp_ms,
    common_end_timestamp_ms as end_timestamp_ms,
    common_con_duration_ms as duration_ms,
    common_establish_latency_ms as tcp_handshake_latency_ms,
    common_ingestion_time as ingestion_time,
    common_processing_time as processing_time,
    -- common_insert_time as insert_time,
    common_device_id as device_id,
    common_out_link_id as out_link_id,
    common_in_link_id as in_link_id,
    common_device_tag as device_tag,
    common_data_center as data_center,
    common_device_group as device_group,
    common_sled_ip as sled_ip,
    common_address_type as address_type,
    common_vsys_id as vsys_id,
    common_t_vsys_id as t_vsys_id,
    common_flags as flags,
    common_flags_identify_info as flags_identify_info,
    if(common_action in (16, 96), array(common_policy_id), array()) as security_rule_list, -- in(Deny、Allow) array(common_policy_id) 安全表
    case common_action
        when 16 then 'Deny'
        when 96 then 'Allow'
        else ''
    end as security_action, -- Deny16、Allow96 else ''
    if(common_action = 1, array(common_policy_id), array()) as monitor_rule_list, -- 是Monitor(1) 放common_policy_id
    common_shaping_rule_ids as shaping_rule_list,
    -- as proxy_rule_list,
    -- as statistics_rule_list,
    -- as sc_rule_list,
    -- as sc_rsp_raw,
    -- as sc_rsp_decrypted,
    -- as proxy_action,
    -- as proxy_pinning_status,
    -- as proxy_intercept_status,
    -- as proxy_passthrough_reason,
    -- as proxy_client_side_latency_ms,
    -- as proxy_server_side_latency_ms,
    -- as proxy_client_side_version,
    -- as proxy_server_side_version,
    -- as proxy_cert_verify,
    -- as proxy_intercept_error,
    common_mirrored_pkts as monitor_mirrored_pkts,
    common_mirrored_bytes as monitor_mirrored_bytes,
    common_client_ip as client_ip,
    common_client_port as client_port,
    common_client_os_name as client_os_desc,
    common_client_location as client_geolocation,
    common_client_asn as client_asn,
    common_subscriber_id as subscriber_id,
    common_imei as imei,
    common_imsi as imsi,
    common_phone_number as phone_number,
    -- as apn,
    common_server_ip as server_ip,
    common_server_port as server_port,
    common_server_os_name as server_os_desc,
    common_server_location as server_geolocation,
    common_server_asn as server_asn,
    common_server_fqdn as server_fqdn,
    common_server_domain as server_domain,
    common_app_full_path as app_transition,
    common_app_label as app,
    -- app_debug_info,
    -- common_app_behavior as app_content,
    common_service_category as fqdn_category_list,
    -- ip_protocol,
    common_protocol_label as decoded_path,
    dns_message_id as dns_message_id,
    dns_qr as dns_qr,
    dns_opcode as dns_opcode,
    dns_aa as dns_aa,
    dns_tc as dns_tc,
    dns_rd as dns_rd,
    dns_ra as dns_ra,
    dns_rcode as dns_rcode,
    dns_qdcount as dns_qdcount,
    dns_ancount as dns_ancount,
    dns_nscount as dns_nscount,
    dns_arcount as dns_arcount,
    dns_qname as dns_qname,
    dns_qtype as dns_qtype,
    dns_qclass as dns_qclass,
    dns_cname as dns_cname,
    dns_sub as dns_sub,
    dns_rr as dns_rr,
    dns_response_latency_ms as dns_response_latency_ms,
    http_url as http_url,
    http_host as http_host,
    http_request_line as http_request_line,
    http_response_line as http_response_line,
    http_request_body as http_request_body,
    http_response_body as http_response_body,
    http_proxy_flag as http_proxy_flag,
    http_sequence as http_sequence,
    http_cookie as http_cookie,
    http_referer as http_referer,
    http_user_agent as http_user_agent,
    http_request_content_length as http_request_content_length,
    http_request_content_type as http_request_content_type,
    http_response_content_length as http_response_content_length,
    http_response_content_type as http_response_content_type,
    http_set_cookie as http_set_cookie,
    http_version as http_version,
    http_status_code as http_status_code,
    http_response_latency_ms as http_response_latency_ms,
    http_session_duration_ms as http_session_duration_ms,
    http_action_file_size as http_action_file_size,
    ssl_version as ssl_version,
    ssl_sni as ssl_sni,
    ssl_san as ssl_san,
    ssl_cn as ssl_cn,
    ssl_con_latency_ms as ssl_handshake_latency_ms,
    ssl_ja3_hash as ssl_ja3_hash,
    ssl_ja3s_hash as ssl_ja3s_hash,
    ssl_cert_issuer as ssl_cert_issuer,
    ssl_cert_subject as ssl_cert_subject,
    ssl_esni_flag as ssl_esni_flag,
    ssl_ech_flag as ssl_ech_flag,
    dtls_cookie as dtls_cookie,
    dtls_version as dtls_version,
    dtls_sni as dtls_sni,
    dtls_san as dtls_san,
    dtls_cn as dtls_cn,
    dtls_con_latency_ms as dtls_handshake_latency_ms,
    dtls_ja3_fingerprint as dtls_ja3_fingerprint,
    dtls_ja3_hash as dtls_ja3_hash,
    dtls_cert_issuer as dtls_cert_issuer,
    dtls_cert_subject as dtls_cert_subject,
    mail_protocol_type as mail_protocol_type,
    mail_account as mail_account,
    mail_from_cmd as mail_from_cmd,
    mail_to_cmd as mail_to_cmd,
    mail_from as mail_from,
    -- as mail_password,
    mail_to as mail_to,
    mail_cc as mail_cc,
    mail_bcc as mail_bcc,
    mail_subject as mail_subject,
    mail_subject_charset as mail_subject_charset,
    mail_attachment_name as mail_attachment_name,
    mail_attachment_name_charset as mail_attachment_name_charset,
    mail_eml_file as mail_eml_file,
    ftp_account as ftp_account,
    ftp_url as ftp_url,
    ftp_link_type as ftp_link_type,
    quic_version as quic_version,
    quic_sni as quic_sni,
    quic_user_agent as quic_user_agent,
    rdp_cookie as rdp_cookie,
    rdp_security_protocol as rdp_security_protocol,
    rdp_client_channels as rdp_client_channels,
    rdp_keyboard_layout as rdp_keyboard_layout,
    rdp_client_version as rdp_client_version,
    rdp_client_name as rdp_client_name,
    rdp_client_product_id as rdp_client_product_id,
    rdp_desktop_width as rdp_desktop_width,
    rdp_desktop_height as rdp_desktop_height,
    rdp_requested_color_depth as rdp_requested_color_depth,
    rdp_certificate_type as rdp_certificate_type,
    rdp_certificate_count as rdp_certificate_count,
    rdp_certificate_permanent as rdp_certificate_permanent,
    rdp_encryption_level as rdp_encryption_level,
    rdp_encryption_method as rdp_encryption_method,
    ssh_version as ssh_version,
    ssh_auth_success as ssh_auth_success,
    ssh_client_version as ssh_client_version,
    ssh_server_version as ssh_server_version,
    ssh_cipher_alg as ssh_cipher_alg,
    ssh_mac_alg as ssh_mac_alg,
    ssh_compression_alg as ssh_compression_alg,
    ssh_kex_alg as ssh_kex_alg,
    ssh_host_key_alg as ssh_host_key_alg,
    ssh_host_key as ssh_host_key,
    ssh_hassh as ssh_hassh,
    sip_call_id as sip_call_id,
    sip_originator_description as sip_originator_description,
    sip_responder_description as sip_responder_description,
    sip_user_agent as sip_user_agent,
    sip_server as sip_server,
    sip_originator_sdp_connect_ip as sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port as sip_originator_sdp_media_port,
    sip_originator_sdp_media_type as sip_originator_sdp_media_type,
    sip_originator_sdp_content as sip_originator_sdp_content,
    sip_responder_sdp_connect_ip as sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port as sip_responder_sdp_media_port,
    sip_responder_sdp_media_type as sip_responder_sdp_media_type,
    sip_responder_sdp_content as sip_responder_sdp_content,
    sip_duration_s as sip_duration_s,
    sip_bye as sip_bye,
    rtp_payload_type_c2s as rtp_payload_type_c2s,
    rtp_payload_type_s2c as rtp_payload_type_s2c,
    rtp_pcap_path as rtp_pcap_path,
    rtp_originator_dir as rtp_originator_dir,
    stratum_cryptocurrency as stratum_cryptocurrency,
    stratum_mining_pools as stratum_mining_pools,
    stratum_mining_program as stratum_mining_program,
    -- as stratum_mining_subscribe,
    common_c2s_pkt_num as sent_pkts,
    common_s2c_pkt_num as received_pkts,
    common_c2s_byte_num as sent_bytes,
    common_s2c_byte_num as received_bytes,
    common_c2s_ipfrag_num as tcp_c2s_ip_fragments,
    common_s2c_ipfrag_num as tcp_s2c_ip_fragments,
    common_c2s_tcp_lostlen as tcp_c2s_lost_bytes,
    common_s2c_tcp_lostlen as tcp_s2c_lost_bytes,
    common_c2s_tcp_unorder_num as tcp_c2s_o3_pkts,
    common_s2c_tcp_unorder_num as tcp_s2c_o3_pkts,
    common_c2s_pkt_retrans as tcp_c2s_rtx_pkts,
    common_s2c_pkt_retrans as tcp_s2c_rtx_pkts,
    common_c2s_byte_retrans as tcp_c2s_rtx_bytes,
    common_s2c_byte_retrans as tcp_s2c_rtx_bytes,
    common_first_ttl as tcp_rtt_ms,
    common_tcp_client_isn as tcp_client_isn,
    common_tcp_server_isn as tcp_server_isn,
    common_packet_capture_file as packet_capture_file,
    common_in_src_mac as in_src_mac,
    common_out_src_mac as out_src_mac,
    common_in_dest_mac as in_dest_mac,
    common_out_dest_mac as out_dest_mac,
    common_tunnels as tunnels,
    common_has_dup_traffic as dup_traffic_flag,
    common_tunnel_endpoint_a_desc as tunnel_endpoint_a_desc,
    common_tunnel_endpoint_b_desc as tunnel_endpoint_b_desc
FROM $monitor_event_table_src
where common_recv_time >= $input_time_start and common_recv_time < $input_time_end
    and common_action = 1
;"
    # echo "sql:$monitor_event_table_src => $monitor_event_table_dest where common_recv_time >= $input_time_start and common_recv_time < $input_time_end"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_transaction_record_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $transaction_record_table_dest
(
    recv_time,
    log_id,
    decoded_as,
    session_id,
    ingestion_time,
    processing_time,
    -- insert_time,
    address_type,
    vsys_id,
    client_ip,
    client_port,
    server_ip,
    server_port,
    sent_pkts,
    received_pkts,
    sent_bytes,
    received_bytes,
    dns_message_id,
    dns_qr,
    dns_opcode,
    dns_aa,
    dns_tc,
    dns_rd,
    dns_ra,
    dns_rcode,
    dns_qdcount,
    dns_ancount,
    dns_nscount,
    dns_arcount,
    dns_qname,
    dns_qtype,
    dns_qclass,
    dns_cname,
    dns_sub,
    dns_rr,
    dns_response_latency_ms,
    http_url,
    http_host,
    http_request_line,
    http_response_line,
    http_request_body,
    http_response_body,
    http_proxy_flag,
    http_sequence,
    http_cookie,
    http_referer,
    http_user_agent,
    http_request_content_length,
    http_request_content_type,
    http_response_content_length,
    http_response_content_type,
    http_set_cookie,
    http_version,
    http_status_code,
    http_response_latency_ms,
    http_session_duration_ms,
    http_action_file_size,
    -- mail_protocol_type,
    -- mail_account,
    -- mail_from_cmd,
    -- mail_to_cmd,
    -- mail_from,
    -- mail_password,
    -- mail_to,
    -- mail_cc,
    -- mail_bcc,
    -- mail_subject,
    -- mail_subject_charset,
    -- mail_attachment_name,
    -- mail_attachment_name_charset,
    -- mail_eml_file,
    sip_call_id,
    sip_originator_description,
    sip_responder_description,
    sip_user_agent,
    sip_server,
    sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port,
    sip_originator_sdp_media_type,
    sip_originator_sdp_content,
    sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port,
    sip_responder_sdp_media_type,
    sip_responder_sdp_content,
    sip_duration_s,
    sip_bye
)
SELECT
    common_recv_time as recv_time,
    common_log_id as log_id,
    common_schema_type as decoded_as,
    common_stream_trace_id as session_id,
    common_ingestion_time as ingestion_time,
    common_processing_time as processing_time,
    -- common_insert_time as insert_time,
    common_address_type as address_type,
    common_vsys_id as vsys_id,
    common_client_ip as client_ip,
    common_client_port as client_port,
    common_server_ip as server_ip,
    common_server_port as server_port,
    common_c2s_pkt_num as sent_pkts,
    common_s2c_pkt_num as received_pkts,
    common_c2s_byte_num as sent_bytes,
    common_s2c_byte_num as received_bytes,
    dns_message_id as dns_message_id,
    dns_qr as dns_qr,
    dns_opcode as dns_opcode,
    dns_aa as dns_aa,
    dns_tc as dns_tc,
    dns_rd as dns_rd,
    dns_ra as dns_ra,
    dns_rcode as dns_rcode,
    dns_qdcount as dns_qdcount,
    dns_ancount as dns_ancount,
    dns_nscount as dns_nscount,
    dns_arcount as dns_arcount,
    dns_qname as dns_qname,
    dns_qtype as dns_qtype,
    dns_qclass as dns_qclass,
    dns_cname as dns_cname,
    dns_sub as dns_sub,
    dns_rr as dns_rr,
    dns_response_latency_ms as dns_response_latency_ms,
    http_url as http_url,
    http_host as http_host,
    http_request_line as http_request_line,
    http_response_line as http_response_line,
    http_request_body as http_request_body,
    http_response_body as http_response_body,
    http_proxy_flag as http_proxy_flag,
    http_sequence as http_sequence,
    http_cookie as http_cookie,
    http_referer as http_referer,
    http_user_agent as http_user_agent,
    http_request_content_length as http_request_content_length,
    http_request_content_type as http_request_content_type,
    http_response_content_length as http_response_content_length,
    http_response_content_type as http_response_content_type,
    http_set_cookie as http_set_cookie,
    http_version as http_version,
    http_status_code as http_status_code,
    http_response_latency_ms as http_response_latency_ms,
    http_session_duration_ms as http_session_duration_ms,
    http_action_file_size as http_action_file_size,
    -- as mail_protocol_type,
    -- as mail_account,
    -- as mail_from_cmd,
    -- as mail_to_cmd,
    -- as mail_from,
    -- as mail_password,
    -- as mail_to,
    -- as mail_cc,
    -- as mail_bcc,
    -- as mail_subject,
    -- as mail_subject_charset,
    -- as mail_attachment_name,
    -- as mail_attachment_name_charset,
    -- as mail_eml_file,
    sip_call_id as sip_call_id,
    sip_originator_description as sip_originator_description,
    sip_responder_description as sip_responder_description,
    sip_user_agent as sip_user_agent,
    sip_server as sip_server,
    sip_originator_sdp_connect_ip as sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port as sip_originator_sdp_media_port,
    sip_originator_sdp_media_type as sip_originator_sdp_media_type,
    sip_originator_sdp_content as sip_originator_sdp_content,
    sip_responder_sdp_connect_ip as sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port as sip_responder_sdp_media_port,
    sip_responder_sdp_media_type as sip_responder_sdp_media_type,
    sip_responder_sdp_content as sip_responder_sdp_content,
    sip_duration_s as sip_duration_s,
    sip_bye as sip_bye
FROM $transaction_record_table_src
where common_recv_time >= $input_time_start and common_recv_time < $input_time_end
;"
    # echo "sql:$transaction_record_table_src => $transaction_record_table_dest where common_recv_time >= $input_time_start and common_recv_time < $input_time_end"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_voip_record_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $voip_record_table_dest
(
    recv_time,
    log_id,
    decoded_as,
    session_id,
    start_timestamp_ms,
    end_timestamp_ms,
    duration_ms,
    tcp_handshake_latency_ms,
    ingestion_time,
    processing_time,
    -- insert_time,
    device_id,
    out_link_id,
    in_link_id,
    device_tag,
    data_center,
    device_group,
    sled_ip,
    address_type,
    vsys_id,
    t_vsys_id,
    flags,
    flags_identify_info,
    -- security_rule_list,
    -- security_action,
    -- monitor_rule_list,
    shaping_rule_list,
    -- proxy_rule_list,
    -- statistics_rule_list,
    -- sc_rule_list,
    -- sc_rsp_raw,
    -- sc_rsp_decrypted,
    -- proxy_action,
    -- proxy_pinning_status,
    -- proxy_intercept_status,
    -- proxy_passthrough_reason,
    -- proxy_client_side_latency_ms,
    -- proxy_server_side_latency_ms,
    -- proxy_client_side_version,
    -- proxy_server_side_version,
    -- proxy_cert_verify,
    -- proxy_intercept_error,
    monitor_mirrored_pkts,
    monitor_mirrored_bytes,
    client_ip,
    client_port,
    client_os_desc,
    client_geolocation,
    client_asn,
    subscriber_id,
    imei,
    imsi,
    phone_number,
    -- apn,
    server_ip,
    server_port,
    server_os_desc,
    server_geolocation,
    server_asn,
    server_fqdn,
    server_domain,
    app_transition,
    app,
    -- app_debug_info,
    -- app_content,
    fqdn_category_list,
    -- ip_protocol,
    decoded_path,
    sip_call_id,
    sip_originator_description,
    sip_responder_description,
    sip_user_agent,
    sip_server,
    sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port,
    sip_originator_sdp_media_type,
    sip_originator_sdp_content,
    sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port,
    sip_responder_sdp_media_type,
    sip_responder_sdp_content,
    sip_duration_s,
    sip_bye,
    rtp_payload_type_c2s,
    rtp_payload_type_s2c,
    rtp_pcap_path,
    rtp_originator_dir,
    sent_pkts,
    received_pkts,
    sent_bytes,
    received_bytes,
    tcp_c2s_ip_fragments,
    tcp_s2c_ip_fragments,
    tcp_c2s_lost_bytes,
    tcp_s2c_lost_bytes,
    tcp_c2s_o3_pkts,
    tcp_s2c_o3_pkts,
    tcp_c2s_rtx_pkts,
    tcp_s2c_rtx_pkts,
    tcp_c2s_rtx_bytes,
    tcp_s2c_rtx_bytes,
    tcp_rtt_ms,
    tcp_client_isn,
    tcp_server_isn,
    packet_capture_file,
    in_src_mac,
    out_src_mac,
    in_dest_mac,
    out_dest_mac,
    tunnels,
    dup_traffic_flag,
    tunnel_endpoint_a_desc,
    tunnel_endpoint_b_desc
)
SELECT
    common_recv_time as recv_time,
    common_log_id as log_id,
    common_schema_type as decoded_as,
    common_stream_trace_id as session_id,
    common_start_timestamp_ms as start_timestamp_ms,
    common_end_timestamp_ms as end_timestamp_ms,
    common_con_duration_ms as duration_ms,
    common_establish_latency_ms as tcp_handshake_latency_ms,
    common_ingestion_time as ingestion_time,
    common_processing_time as processing_time,
    -- common_insert_time as insert_time,
    common_device_id as device_id,
    common_out_link_id as out_link_id,
    common_in_link_id as in_link_id,
    common_device_tag as device_tag,
    common_data_center as data_center,
    common_device_group as device_group,
    common_sled_ip as sled_ip,
    common_address_type as address_type,
    common_vsys_id as vsys_id,
    common_t_vsys_id as t_vsys_id,
    common_flags as flags,
    common_flags_identify_info as flags_identify_info,
    -- as security_rule_list,
    -- as security_action,
    -- as monitor_rule_list,
    common_shaping_rule_ids as shaping_rule_list,
    -- as proxy_rule_list,
    -- as statistics_rule_list,
    -- as sc_rule_list,
    -- as sc_rsp_raw,
    -- as sc_rsp_decrypted,
    -- as proxy_action,
    -- as proxy_pinning_status,
    -- as proxy_intercept_status,
    -- as proxy_passthrough_reason,
    -- as proxy_client_side_latency_ms,
    -- as proxy_server_side_latency_ms,
    -- as proxy_client_side_version,
    -- as proxy_server_side_version,
    -- as proxy_cert_verify,
    -- as proxy_intercept_error,
    common_mirrored_pkts as monitor_mirrored_pkts,
    common_mirrored_bytes as monitor_mirrored_bytes,
    common_client_ip as client_ip,
    common_client_port as client_port,
    common_client_os_name as client_os_desc,
    common_client_location as client_geolocation,
    common_client_asn as client_asn,
    common_subscriber_id as subscriber_id,
    common_imei as imei,
    common_imsi as imsi,
    common_phone_number as phone_number,
    -- as apn,
    common_server_ip as server_ip,
    common_server_port as server_port,
    common_server_os_name as server_os_desc,
    common_server_location as server_geolocation,
    common_server_asn as server_asn,
    common_server_fqdn as server_fqdn,
    common_server_domain as server_domain,
    common_app_full_path as app_transition,
    common_app_label as app,
    -- app_debug_info,
    -- common_app_behavior as app_content,
    common_service_category as fqdn_category_list,
    -- ip_protocol,
    common_protocol_label as decoded_path,
    sip_call_id as sip_call_id,
    sip_originator_description as sip_originator_description,
    sip_responder_description as sip_responder_description,
    sip_user_agent as sip_user_agent,
    sip_server as sip_server,
    sip_originator_sdp_connect_ip as sip_originator_sdp_connect_ip,
    sip_originator_sdp_media_port as sip_originator_sdp_media_port,
    sip_originator_sdp_media_type as sip_originator_sdp_media_type,
    sip_originator_sdp_content as sip_originator_sdp_content,
    sip_responder_sdp_connect_ip as sip_responder_sdp_connect_ip,
    sip_responder_sdp_media_port as sip_responder_sdp_media_port,
    sip_responder_sdp_media_type as sip_responder_sdp_media_type,
    sip_responder_sdp_content as sip_responder_sdp_content,
    sip_duration_s as sip_duration_s,
    sip_bye as sip_bye,
    rtp_payload_type_c2s as rtp_payload_type_c2s,
    rtp_payload_type_s2c as rtp_payload_type_s2c,
    rtp_pcap_path as rtp_pcap_path,
    rtp_originator_dir as rtp_originator_dir,
    common_c2s_pkt_num as sent_pkts,
    common_s2c_pkt_num as received_pkts,
    common_c2s_byte_num as sent_bytes,
    common_s2c_byte_num as received_bytes,
    common_c2s_ipfrag_num as tcp_c2s_ip_fragments,
    common_s2c_ipfrag_num as tcp_s2c_ip_fragments,
    common_c2s_tcp_lostlen as tcp_c2s_lost_bytes,
    common_s2c_tcp_lostlen as tcp_s2c_lost_bytes,
    common_c2s_tcp_unorder_num as tcp_c2s_o3_pkts,
    common_s2c_tcp_unorder_num as tcp_s2c_o3_pkts,
    common_c2s_pkt_retrans as tcp_c2s_rtx_pkts,
    common_s2c_pkt_retrans as tcp_s2c_rtx_pkts,
    common_c2s_byte_retrans as tcp_c2s_rtx_bytes,
    common_s2c_byte_retrans as tcp_s2c_rtx_bytes,
    common_first_ttl as tcp_rtt_ms,
    common_tcp_client_isn as tcp_client_isn,
    common_tcp_server_isn as tcp_server_isn,
    common_packet_capture_file as packet_capture_file,
    common_in_src_mac as in_src_mac,
    common_out_src_mac as out_src_mac,
    common_in_dest_mac as in_dest_mac,
    common_out_dest_mac as out_dest_mac,
    common_tunnels as tunnels,
    common_has_dup_traffic as dup_traffic_flag,
    common_tunnel_endpoint_a_desc as tunnel_endpoint_a_desc,
    common_tunnel_endpoint_b_desc as tunnel_endpoint_b_desc
FROM $voip_record_table_src
where common_recv_time >= $input_time_start and common_recv_time < $input_time_end
;"
    # echo "sql:$voip_record_table_src => $voip_record_table_dest where common_recv_time >= $input_time_start and common_recv_time < $input_time_end"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_proxy_event_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $proxy_event_table_dest
(
    recv_time,
    log_id,
    decoded_as,
    session_id,
    start_timestamp_ms,
    end_timestamp_ms,
    duration_ms,
    tcp_handshake_latency_ms,
    ingestion_time,
    processing_time,
    -- insert_time,
    device_id,
    out_link_id,
    in_link_id,
    device_tag,
    data_center,
    device_group,
    sled_ip,
    address_type,
    vsys_id,
    t_vsys_id,
    flags,
    flags_identify_info,
    -- security_rule_list,
    -- security_action,
    -- monitor_rule_list,
    shaping_rule_list,
    -- proxy_rule_list,
    -- statistics_rule_list,
    -- sc_rule_list,
    -- sc_rsp_raw,
    -- sc_rsp_decrypted,
    -- proxy_action,
    -- proxy_pinning_status,
    -- proxy_intercept_status,
    -- proxy_passthrough_reason,
    -- proxy_client_side_latency_ms,
    -- proxy_server_side_latency_ms,
    -- proxy_client_side_version,
    -- proxy_server_side_version,
    -- proxy_cert_verify,
    -- proxy_intercept_error,
    monitor_mirrored_pkts,
    monitor_mirrored_bytes,
    client_ip,
    client_port,
    client_os_desc,
    client_geolocation,
    client_asn,
    subscriber_id,
    imei,
    imsi,
    phone_number,
    -- apn,
    server_ip,
    server_port,
    server_os_desc,
    server_geolocation,
    server_asn,
    server_fqdn,
    server_domain,
    app_transition,
    app,
    -- app_debug_info,
    -- app_content,
    fqdn_category_list,
    -- ip_protocol,
    decoded_path,
    http_url,
    http_host,
    http_request_line,
    http_response_line,
    http_request_body,
    http_response_body,
    http_proxy_flag,
    http_sequence,
    http_cookie,
    http_referer,
    http_user_agent,
    http_request_content_length,
    http_request_content_type,
    http_response_content_length,
    http_response_content_type,
    http_set_cookie,
    http_version,
    http_status_code,
    http_response_latency_ms,
    http_session_duration_ms,
    http_action_file_size,
    doh_url,
    doh_host,
    doh_request_line,
    doh_response_line,
    doh_cookie,
    doh_referer,
    doh_user_agent,
    doh_content_length,
    doh_content_type,
    doh_set_cookie,
    doh_version,
    doh_message_id,
    doh_qr,
    doh_opcode,
    doh_aa,
    doh_tc,
    doh_rd,
    doh_ra,
    doh_rcode,
    doh_qdcount,
    doh_ancount,
    doh_nscount,
    doh_arcount,
    doh_qname,
    doh_qtype,
    doh_qclass,
    doh_cname,
    doh_sub,
    doh_rr,
    sent_pkts,
    received_pkts,
    sent_bytes,
    received_bytes,
    tcp_c2s_ip_fragments,
    tcp_s2c_ip_fragments,
    tcp_c2s_lost_bytes,
    tcp_s2c_lost_bytes,
    tcp_c2s_o3_pkts,
    tcp_s2c_o3_pkts,
    tcp_c2s_rtx_pkts,
    tcp_s2c_rtx_pkts,
    tcp_c2s_rtx_bytes,
    tcp_s2c_rtx_bytes,
    tcp_rtt_ms,
    tcp_client_isn,
    tcp_server_isn,
    packet_capture_file,
    in_src_mac,
    out_src_mac,
    in_dest_mac,
    out_dest_mac,
    tunnels,
    dup_traffic_flag,
    tunnel_endpoint_a_desc,
    tunnel_endpoint_b_desc
)
SELECT
    common_recv_time as recv_time,
    common_log_id as log_id,
    common_schema_type as decoded_as,
    common_stream_trace_id as session_id,
    common_start_timestamp_ms as start_timestamp_ms,
    common_end_timestamp_ms as end_timestamp_ms,
    common_con_duration_ms as duration_ms,
    common_establish_latency_ms as tcp_handshake_latency_ms,
    common_ingestion_time as ingestion_time,
    common_processing_time as processing_time,
    -- common_insert_time as insert_time,
    common_device_id as device_id,
    common_out_link_id as out_link_id,
    common_in_link_id as in_link_id,
    common_device_tag as device_tag,
    common_data_center as data_center,
    common_device_group as device_group,
    common_sled_ip as sled_ip,
    common_address_type as address_type,
    common_vsys_id as vsys_id,
    common_t_vsys_id as t_vsys_id,
    common_flags as flags,
    common_flags_identify_info as flags_identify_info,
    -- as security_rule_list,
    -- as security_action,
    -- as monitor_rule_list,
    common_shaping_rule_ids as shaping_rule_list,
    -- as proxy_rule_list,
    -- as statistics_rule_list,
    -- as sc_rule_list,
    -- as sc_rsp_raw,
    -- as sc_rsp_decrypted,
    -- as proxy_action,
    -- as proxy_pinning_status,
    -- as proxy_intercept_status,
    -- as proxy_passthrough_reason,
    -- as proxy_client_side_latency_ms,
    -- as proxy_server_side_latency_ms,
    -- as proxy_client_side_version,
    -- as proxy_server_side_version,
    -- as proxy_cert_verify,
    -- as proxy_intercept_error,
    common_mirrored_pkts as monitor_mirrored_pkts,
    common_mirrored_bytes as monitor_mirrored_bytes,
    common_client_ip as client_ip,
    common_client_port as client_port,
    common_client_os_name as client_os_desc,
    common_client_location as client_geolocation,
    common_client_asn as client_asn,
    common_subscriber_id as subscriber_id,
    common_imei as imei,
    common_imsi as imsi,
    common_phone_number as phone_number,
    -- as apn,
    common_server_ip as server_ip,
    common_server_port as server_port,
    common_server_os_name as server_os_desc,
    common_server_location as server_geolocation,
    common_server_asn as server_asn,
    common_server_fqdn as server_fqdn,
    common_server_domain as server_domain,
    common_app_full_path as app_transition,
    common_app_label as app,
    -- app_debug_info,
    -- common_app_behavior as app_content,
    common_service_category as fqdn_category_list,
    -- ip_protocol,
    common_protocol_label as decoded_path,
    http_url as http_url,
    http_host as http_host,
    http_request_line as http_request_line,
    http_response_line as http_response_line,
    http_request_body as http_request_body,
    http_response_body as http_response_body,
    http_proxy_flag as http_proxy_flag,
    http_sequence as http_sequence,
    http_cookie as http_cookie,
    http_referer as http_referer,
    http_user_agent as http_user_agent,
    http_request_content_length as http_request_content_length,
    http_request_content_type as http_request_content_type,
    http_response_content_length as http_response_content_length,
    http_response_content_type as http_response_content_type,
    http_set_cookie as http_set_cookie,
    http_version as http_version,
    http_status_code as http_status_code,
    http_response_latency_ms as http_response_latency_ms,
    http_session_duration_ms as http_session_duration_ms,
    http_action_file_size as http_action_file_size,
    doh_url as doh_url,
    doh_host as doh_host,
    doh_request_line as doh_request_line,
    doh_response_line as doh_response_line,
    doh_cookie as doh_cookie,
    doh_referer as doh_referer,
    doh_user_agent as doh_user_agent,
    doh_content_length as doh_content_length,
    doh_content_type as doh_content_type,
    doh_set_cookie as doh_set_cookie,
    doh_version as doh_version,
    doh_message_id as doh_message_id,
    doh_qr as doh_qr,
    doh_opcode as doh_opcode,
    doh_aa as doh_aa,
    doh_tc as doh_tc,
    doh_rd as doh_rd,
    doh_ra as doh_ra,
    doh_rcode as doh_rcode,
    doh_qdcount as doh_qdcount,
    doh_ancount as doh_ancount,
    doh_nscount as doh_nscount,
    doh_arcount as doh_arcount,
    doh_qname as doh_qname,
    doh_qtype as doh_qtype,
    doh_qclass as doh_qclass,
    doh_cname as doh_cname,
    doh_sub as doh_sub,
    doh_rr as doh_rr,
    common_c2s_pkt_num as sent_pkts,
    common_s2c_pkt_num as received_pkts,
    common_c2s_byte_num as sent_bytes,
    common_s2c_byte_num as received_bytes,
    common_c2s_ipfrag_num as tcp_c2s_ip_fragments,
    common_s2c_ipfrag_num as tcp_s2c_ip_fragments,
    common_c2s_tcp_lostlen as tcp_c2s_lost_bytes,
    common_s2c_tcp_lostlen as tcp_s2c_lost_bytes,
    common_c2s_tcp_unorder_num as tcp_c2s_o3_pkts,
    common_s2c_tcp_unorder_num as tcp_s2c_o3_pkts,
    common_c2s_pkt_retrans as tcp_c2s_rtx_pkts,
    common_s2c_pkt_retrans as tcp_s2c_rtx_pkts,
    common_c2s_byte_retrans as tcp_c2s_rtx_bytes,
    common_s2c_byte_retrans as tcp_s2c_rtx_bytes,
    common_first_ttl as tcp_rtt_ms,
    common_tcp_client_isn as tcp_client_isn,
    common_tcp_server_isn as tcp_server_isn,
    common_packet_capture_file as packet_capture_file,
    common_in_src_mac as in_src_mac,
    common_out_src_mac as out_src_mac,
    common_in_dest_mac as in_dest_mac,
    common_out_dest_mac as out_dest_mac,
    common_tunnels as tunnels,
    common_has_dup_traffic as dup_traffic_flag,
    common_tunnel_endpoint_a_desc as tunnel_endpoint_a_desc,
    common_tunnel_endpoint_b_desc as tunnel_endpoint_b_desc
FROM $proxy_event_table_src
where common_recv_time >= $input_time_start and common_recv_time < $input_time_end
;"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

migrate_dos_event_table_one_part(){
    input_time_start=$1
    input_time_end=$2
    insert_sql="insert into $dos_event_table_dest
(
    vsys_id,
    recv_time,
    log_id,
    profile_id,
    start_time,
    end_time,
    attack_type,
    severity,
    conditions,
    destination_ip,
    destination_country,
    source_ip_list,
    source_country_list,
    session_rate,
    packet_rate,
    bit_rate
)
SELECT
    vsys_id as vsys_id,
    start_time as recv_time,
    log_id as log_id,
    profile_id as profile_id,
    start_time as start_time,
    end_time as end_time,
    attack_type as attack_type,
    severity as severity,
    conditions as conditions,
    destination_ip as destination_ip,
    destination_country as destination_country,
    source_ip_list as source_ip_list,
    source_country_list as source_country_list,
    session_rate as session_rate,
    packet_rate as packet_rate,
    bit_rate as bit_rate
FROM $dos_event_table_src
where start_time >= $input_time_start and start_time < $input_time_end
;"
    clickhouse-client -h $ip --port $ck_port -m -n -u $ck_username --password $ck_password --max_insert_threads=$max_threads --max_threads=$max_threads  --max_execution_time=$ck_max_execution_time --query="$insert_sql"
    rst_code=$?
    start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
    end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
    if [ $rst_code -eq 0 ]; then
         insert_success_cnt=$(($insert_success_cnt+1))
         echo "同步数据段成功:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    else
         insert_fail_cnt=$(($insert_fail_cnt+1))
         echo "同步数据段失败:[${start_time}, ${end_time}]. in `date --utc +'%Y-%m-%d %H:%M:%S'`"
    fi
}

slice_time_interval=$((60*slice_interval_minute))
data_split_part=$(((timestamp_end-timestamp_start)/slice_time_interval))

# 输出划分的时间段
show_time_range(){
    echo "split time ranges:"
    for ((i = 0 ; i <= $data_split_part ; i++))
    do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        echo "time_range:$start_time, $end_time"
    done
}

# 迁移session_record
migrate_session_record_table(){
    echo "**********start migrate session_record table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start session_record part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_session_record_table_one_part $input_time_start $input_time_end
        echo "end session_record part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate session_record table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移security_event
migrate_security_event_table(){
    echo "**********start migrate security_event table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start security_event part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_security_event_table_one_part $input_time_start $input_time_end
        echo "end security_event part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate security_event table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移monitor_event
migrate_monitor_event_table(){
    echo "**********start migrate monitor_event table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start monitor_event part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_monitor_event_table_one_part $input_time_start $input_time_end
        echo "end monitor_event part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate monitor_event table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移transaction_record
migrate_transaction_record_table(){
    echo "**********start migrate transaction_record table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start transaction_record part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_transaction_record_table_one_part $input_time_start $input_time_end
        echo "end transaction_record part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate transaction_record table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移voip_record
migrate_voip_record_table(){
    echo "**********start migrate voip_record table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start voip_record part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_voip_record_table_one_part $input_time_start $input_time_end
        echo "end voip_record part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate voip_record table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移proxy_event
migrate_proxy_event_table(){
    echo "**********start migrate $table table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_proxy_event_table_one_part $input_time_start $input_time_end
        echo "end $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate $table table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 迁移dos_event
migrate_dos_event_table(){
    echo "**********start migrate $table table in `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
    
    # 遍历每个时间段数据
    for ((i = 0 ; i <= $data_split_part ; i++))
        do
        input_time_end=$((timestamp_end-i*slice_time_interval))
        input_time_start=$((input_time_end-slice_time_interval))
        
        if [ $i -eq $data_split_part ]; then
            # 正好均分
            if [ $input_time_end -le $timestamp_start ]; then
                continue
            fi
            input_time_start=$timestamp_start
        fi

        
        start_time=`date --utc -d @$input_time_start "+%Y-%m-%d %H:%M:%S"`
        end_time=`date --utc -d @$input_time_end "+%Y-%m-%d %H:%M:%S"`
        
        echo "start $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        # 迁移此时间段数据
        migrate_dos_event_table_one_part $input_time_start $input_time_end
        echo "end $table part for time_range:${start_time}(${input_time_start}), ${end_time}(${input_time_end}), in `date --utc +'%Y-%m-%d %H:%M:%S'`"
        echo ""
    done
    
    echo "**********end migrate $table table `date --utc +'%Y-%m-%d %H:%M:%S'`**********"
}

# 输出划分的时间段
show_time_range

# 校验迁移表参数
case $table in
"session_record")
    # 迁移session_record
    migrate_session_record_table
;;
"security_event")
    # 迁移security_event
    migrate_security_event_table
;;
"monitor_event")
    # 迁移monitor_event
    migrate_monitor_event_table
;;
"transaction_record")
    # 迁移transaction_record
    migrate_transaction_record_table
;;
"voip_record")
    # 迁移voip_record
    migrate_voip_record_table
;;
"proxy_event")
    # 迁移proxy_event
    migrate_proxy_event_table
;;
"dos_event")
    # 迁移dos_event
    migrate_dos_event_table
;;
*)
    echo "所迁移表${table}不在范围:session_record，security_event，monitor_event，transaction_record，voip_record，proxy_event，dos_event"
;;
esac

echo "成功迁移数据段:${insert_success_cnt}, 失败迁移数据段:${insert_fail_cnt}"

echo "#####################end `date --utc +'%Y-%m-%d %H:%M:%S'`#######################"
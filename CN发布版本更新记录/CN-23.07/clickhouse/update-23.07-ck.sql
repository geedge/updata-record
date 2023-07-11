ALTER table cyber_narrator_galaxy.session_record_cn_local on cluster ck_cluster add column IF NOT EXISTS common_server_fqdn  String after common_server_port;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_cluster add column IF NOT EXISTS common_server_fqdn  String after common_server_port;
ALTER table cyber_narrator_galaxy.session_record_cn on cluster ck_query add column IF NOT EXISTS common_server_fqdn  String after common_server_port;


drop view IF EXISTS cyber_narrator_galaxy.cn_entity_relation_view ON CLUSTER ck_cluster;

create MATERIALIZED VIEW if not exists cyber_narrator_galaxy.cn_entity_relation_view on cluster ck_cluster TO cyber_narrator_galaxy.cn_entity_relation_local
(
    app_name String,
    fqdn String,
    ip String,
    country String,
    province String,
    region String,
    asn String,
    create_time Int64,
    update_time Int64
) AS
SELECT
    common_app_label AS app_name,
    common_server_fqdn AS fqdn,
    common_server_ip AS ip,
    anyLast(server_country) AS country,
    anyLast(server_province) AS province,
    anyLast(server_region) AS region,
    anyLast(server_asn) AS asn,
    min(c1.common_recv_time) AS create_time,
    max(c1.common_recv_time) AS update_time
FROM cyber_narrator_galaxy.session_record_cn_local c1
where common_l4_protocol ='IPv4_TCP' OR common_server_port in(53,443)
GROUP BY ip,app_name,fqdn;  
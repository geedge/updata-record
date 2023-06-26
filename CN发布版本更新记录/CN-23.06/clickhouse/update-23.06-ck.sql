CREATE TABLE if not exists cyber_narrator_galaxy.cn_entity_relation_local on cluster ck_cluster
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
)
ENGINE = MergeTree
ORDER BY (ip,
 fqdn,
 app_name)
TTL toDateTime(update_time) + toIntervalSecond(2592000),
 toDateTime(update_time) + toIntervalSecond(1) GROUP BY ip,
 fqdn,
 app_name SET create_time = min(create_time),
 update_time = max(update_time),
 country = anyLast(country),
 province = anyLast(province),
 region = anyLast(region),
 asn = anyLast(asn) ;
   
 CREATE TABLE if not exists cyber_narrator_galaxy.cn_entity_relation  on cluster ck_query
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
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_entity_relation_local',
 rand());
 CREATE TABLE if not exists cyber_narrator_galaxy.cn_entity_relation  on cluster ck_cluster
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
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_entity_relation_local',
 rand());
  
 
  CREATE TABLE if not exists cyber_narrator_galaxy.cn_dynamic_info_relation_local on cluster ck_cluster
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
)
ENGINE = MergeTree
ORDER BY (ip,port,l7_protocol)
TTL toDateTime(update_time) + toIntervalSecond(2592000) DELETE,
 toDateTime(update_time) + toIntervalSecond(1) GROUP BY ip,port,l7_protocol
 SET create_time = min(create_time),
 update_time = max(update_time)  ;
 
 CREATE TABLE if not exists cyber_narrator_galaxy.cn_dynamic_info_relation  on cluster ck_query
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_dynamic_info_relation_local',
 rand());
 
 CREATE TABLE if not exists cyber_narrator_galaxy.cn_dynamic_info_relation  on cluster ck_cluster
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
)
ENGINE = Distributed('ck_cluster',
 'cyber_narrator_galaxy',
 'cn_dynamic_info_relation_local',
 rand());


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
    ssl_sni AS fqdn,
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
 
 
  create MATERIALIZED VIEW if not exists cyber_narrator_galaxy.cn_dynamic_info_relation_view on cluster ck_cluster TO cyber_narrator_galaxy.cn_dynamic_info_relation_local
(
    ip String,
    l7_protocol String,
    port Int64,
    create_time Int64,
    update_time Int64
) AS
SELECT
    common_server_ip as ip,
    common_l7_protocol as l7_protocol,
    common_server_port as port,
    min(c1.common_recv_time) AS create_time,
    max(c1.common_recv_time) AS update_time
FROM cyber_narrator_galaxy.session_record_cn_local c1
where common_l4_protocol ='IPv4_TCP' OR common_server_port in(53,443)
GROUP BY ip,l7_protocol,port;  

--通联：
CREATE TABLE session_record_completed_log(
common_schema_type VARCHAR,
common_recv_time BIGINT,
common_client_ip VARCHAR,
common_server_ip VARCHAR,
http_host VARCHAR,
http_domain VARCHAR,
common_device_group VARCHAR,
common_data_center VARCHAR,
common_l4_protocol VARCHAR,
common_internal_ip VARCHAR,
common_external_ip VARCHAR,
common_subscriber_id VARCHAR,
common_sessions BIGINT,
common_app_label VARCHAR,
common_c2s_pkt_num BIGINT,
common_s2c_pkt_num BIGINT,
common_c2s_byte_num BIGINT,
common_s2c_byte_num BIGINT,
common_processing_time BIGINT,
stat_time as TO_TIMESTAMP(FROM_UNIXTIME(common_recv_time)),
WATERMARK FOR stat_time AS stat_time - INTERVAL '1' MINUTE)
WITH(
'connector' = 'kafka',
'properties.group.id' = 'kafka-indexing-service',
'topic' = 'SESSION-RECORD-COMPLETED',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
'scan.startup.mode' = 'latest-offset',
'sink.parallelism'='1',
--'sink.parallelism'='60',
'format' = 'json'
);

--client：
CREATE TABLE top_client_ip_log(
source VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
order_by VARCHAR,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
)WITH(
'connector' = 'upsert-kafka',
'topic' = 'TOP-CLIENT-IP',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
--'sink.parallelism'='1',
'key.format' = 'json',
'value.format' = 'json'
);

CREATE VIEW top_client_ip_view as
SELECT common_client_ip as source,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group ,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where (common_l4_protocol = 'IPv6_TCP' or common_l4_protocol = 'IPv4_TCP') and (common_device_group<>'' or common_data_center<>'')
group by common_client_ip,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);

INSERT INTO top_client_ip_log
(SELECT `source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'sessions' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY session_num DESC) as rownum
FROM
top_client_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'packets' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_pkt_num+s2c_pkt_num DESC) as rownum
FROM
top_client_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'bytes' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_byte_num+s2c_byte_num DESC) as rownum
FROM
top_client_ip_view)
WHERE rownum <= 10000);

--server:
CREATE TABLE top_server_ip_log(
destination VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
order_by VARCHAR,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
)WITH(
'connector' = 'upsert-kafka',
'topic' = 'TOP-SERVER-IP',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
--'sink.parallelism'='1',
'key.format' = 'json',
'value.format' = 'json'
);

CREATE VIEW top_server_ip_view as
SELECT common_server_ip as `destination`,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group ,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where (common_l4_protocol = 'IPv6_TCP' or common_l4_protocol = 'IPv4_TCP') and (common_device_group<>'' or common_data_center<>'') 
group by common_server_ip,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);

INSERT INTO top_server_ip_log
(SELECT `destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'sessions' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY session_num DESC) as rownum
FROM
top_server_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'packets' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_pkt_num+s2c_pkt_num DESC) as rownum
FROM
top_server_ip_view)
WHERE rownum <= 10000)
union all
(SELECT destination, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
destination, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'bytes' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_byte_num+s2c_byte_num DESC) as rownum
FROM
top_server_ip_view)
WHERE rownum <= 10000);

--internal
CREATE TABLE top_internal_ip_log (
source VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
order_by VARCHAR,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
) WITH (
'connector' = 'upsert-kafka',
'topic' = 'TOP-INTERNAL-HOST',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
--'sink.parallelism'='1',
'key.format' = 'json',
'value.format' = 'json'
);

CREATE VIEW top_common_internal_ip_view as
SELECT common_internal_ip as `source`,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where common_internal_ip<>'' and (common_device_group<>'' or common_data_center<>'')
group by common_internal_ip,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);


INSERT INTO top_internal_ip_log
(SELECT `source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'sessions' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY session_num DESC) as rownum
FROM
top_common_internal_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'packets' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_pkt_num+s2c_pkt_num DESC) as rownum
FROM
top_common_internal_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`source`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'bytes' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_byte_num+s2c_byte_num DESC) as rownum
FROM
top_common_internal_ip_view)
WHERE rownum <= 10000);


--external:
CREATE TABLE top_external_ip_log (
destination VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
order_by VARCHAR,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
) WITH (
'connector' = 'upsert-kafka',
'topic' = 'TOP-EXTERNAL-HOST',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
--'sink.parallelism'='1',
'key.format' = 'json',
'value.format' = 'json'
);


CREATE VIEW top_common_external_ip_view as
SELECT common_external_ip as `destination`,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where common_external_ip<>'' and (common_device_group<>'' or common_data_center<>'')
group by common_external_ip,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);


INSERT INTO top_external_ip_log
(SELECT `destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'sessions' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY session_num DESC) as rownum
FROM
top_common_external_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'packets' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_pkt_num+s2c_pkt_num DESC) as rownum
FROM
top_common_external_ip_view)
WHERE rownum <= 10000)
union all
(SELECT `destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`destination`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'bytes' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_byte_num+s2c_byte_num DESC) as rownum
FROM
top_common_external_ip_view)
WHERE rownum <= 10000);

--website_domain
CREATE TABLE top_website_domain_log (
domain VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
order_by VARCHAR,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
) WITH (
'connector' = 'upsert-kafka',
'topic' = 'TOP-WEBSITE-DOMAIN',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
--'sink.parallelism'='1',
'key.format' = 'json',
'value.format' = 'json'
);

CREATE VIEW top_website_domain_view as
SELECT http_domain as `domain`,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group ,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where http_domain<>'' and (common_device_group<>'' or common_data_center<>'')
group by http_domain,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);


INSERT INTO top_website_domain_log
(SELECT `domain`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`domain`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'sessions' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY session_num DESC) as rownum
FROM
top_website_domain_view)
WHERE rownum <= 10000)
union all
(SELECT `domain`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`domain`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'packets' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_pkt_num+s2c_pkt_num DESC) as rownum
FROM
top_website_domain_view)
WHERE rownum <= 10000)
union all
(SELECT `domain`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`domain`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'bytes' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_byte_num+s2c_byte_num DESC) as rownum
FROM
top_website_domain_view)
WHERE rownum <= 10000);


--user:
CREATE TABLE top_user_log (
subscriber_id VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
order_by VARCHAR,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
) WITH (
'connector' = 'upsert-kafka',
'topic' = 'TOP-USER',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
--'sink.parallelism'='1',
'key.format' = 'json',
'value.format' = 'json'
);

CREATE VIEW top_user_log_view as
SELECT common_subscriber_id as `subscriber_id`,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group ,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where common_subscriber_id <>'' and (common_device_group<>'' or common_data_center<>'')
group by common_subscriber_id,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);

INSERT INTO top_user_log
(SELECT `subscriber_id`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`subscriber_id`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'sessions' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY session_num DESC) as rownum
FROM
top_user_log_view)
WHERE rownum <= 10000)
union all
(SELECT `subscriber_id`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`subscriber_id`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'packets' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_pkt_num+s2c_pkt_num DESC) as rownum
FROM
top_user_log_view)
WHERE rownum <= 10000)
union all
(SELECT `subscriber_id`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,order_by,device_group,data_center,stat_time FROM
(SELECT
`subscriber_id`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,'bytes' as order_by,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center ORDER BY c2s_byte_num+s2c_byte_num DESC) as rownum
FROM
top_user_log_view)
WHERE rownum <= 10000);

--app
CREATE TABLE top_app_log (
app_name VARCHAR,
session_num BIGINT,
c2s_pkt_num BIGINT,
s2c_pkt_num BIGINT,
c2s_byte_num BIGINT,
s2c_byte_num BIGINT,
device_group VARCHAR,
data_center VARCHAR,
stat_time BIGINT,
PRIMARY KEY (stat_time) NOT ENFORCED
) WITH (
'connector' = 'upsert-kafka',
'topic' = 'TRAFFIC-APP-STAT',
'properties.bootstrap.servers' = 'kafkabootstrap',
'properties.security.protocol'='SASL_PLAINTEXT',
'properties.sasl.mechanism'='PLAIN',
'properties.sasl.jaas.config'= 'org.apache.kafka.common.security.scram.ScramLoginModule required username="admin" password="galaxy2019";',
'key.format' = 'json',
'value.format' = 'json'
);

CREATE VIEW top_app_log_view as
SELECT common_app_label as `app_name`,sum(common_sessions) as session_num,sum(common_c2s_pkt_num) as c2s_pkt_num,sum(common_s2c_pkt_num) as s2c_pkt_num,sum(common_c2s_byte_num) as c2s_byte_num,sum(common_s2c_byte_num) as s2c_byte_num,common_device_group as device_group ,common_data_center as data_center,UNIX_TIMESTAMP(CAST(TUMBLE_END(stat_time,INTERVAL '5' MINUTE) as VARCHAR)) as stat_time
FROM session_record_completed_log
where common_app_label<>'' and (common_device_group<>'' or common_data_center<>'')
group by common_app_label,common_device_group,common_data_center,TUMBLE(stat_time,INTERVAL '5' MINUTE);

INSERT INTO top_app_log
(SELECT `app_name`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,device_group,data_center,stat_time FROM
(SELECT
`app_name`, session_num, c2s_pkt_num,s2c_pkt_num,c2s_byte_num,s2c_byte_num,device_group,data_center,stat_time,
ROW_NUMBER() OVER (PARTITION BY device_group,data_center )
FROM
top_app_log_view));

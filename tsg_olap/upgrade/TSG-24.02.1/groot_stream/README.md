## session_record.yaml.template
- etl_session_record_kafka_to_ndc_kafka (A-DT) // 多数中心部署：分中心Data Transporter侧经过预处理后，集中汇聚至国家中心（NDC）
    - Topology: kafka_source -> etl_processor -> kafka_sink
    - Data Flow: SESSION-RECORD -> SESSION-RECORD-PROCESSED   
- session_record_processed_kafka_to_clickhouse(A-NDC) // 多数中心部署：国家中心侧加载会话日志写入ClickHouse
    - Topology: kafka_source -> clickhouse_sink
    - Data Flow: SESSION-RECORD-PROCESSED -> session_record_local
- etl_session_record_kafka_to_clickhouse (B)  // 集中部署： 摄入会话日志，预处理后直接携入ClickHouse
    - Topology: kafka_source -> etl_processor -> clickhouse_sink
    - Data Flow: SESSION-RECORD -> session_record_local

## realtime_log_streaming_cn_session_record.yaml.template

`install_cn_udf.sh安装CN UDFs；grootstream.yaml定义CN知识库`

- etl_session_record_kafka_to_cn_kafka
    - Topology: kafka_source -> etl_processor -> post_output_field_processor -> kafka_sink
    - Data Flow: SESSION-RECORD(SESSION-RECORD-PROCESSED) -> SESSION-RECORD-CN
     
## data_transporter.yaml.template

- troubleshooting_file_stream_kafka_to_ndc_kafka

    - Topology:  kafka_source  -> kafka_sink (format:raw)
    - Data Flow: TROUBLESHOOTING-FILE-STREAM-RECORD -> TROUBLESHOOTING-FILE-STREAM-RECORD


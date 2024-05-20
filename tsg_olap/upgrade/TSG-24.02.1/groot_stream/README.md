## session_record.yaml.template
- etl_session_record_kafka_to_ndc_kafka (A-DT) 
    - Topology: kafka_source -> etl_processor -> kafka_sink
    - Data Flow: SESSION-RECORD -> SESSION-RECORD-PROCESSED   
- session_record_processed_kafka_to_clickhouse(A-NDC)
    - Topology: kafka_source -> clickhouse_sink
    - Data Flow: SESSION-RECORD-PROCESSED -> session_record_local
- etl_session_record_kafka_to_clickhouse (B)
    - Topology: kafka_source -> etl_processor -> clickhouse_sink
    - Data Flow: SESSION-RECORD -> session_record_local

## realtime_log_streaming_cn_session_record.yaml.template

- etl_session_record_kafka_to_cn_kafka
    - Topology: kafka_source -> etl_processor -> post_output_field_processor -> kafka_sink
    - Data Flow: SESSION-RECORD(SESSION-RECORD-PROCESSED) -> SESSION-RECORD-CN
     

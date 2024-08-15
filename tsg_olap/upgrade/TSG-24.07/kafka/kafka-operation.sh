#!/bin/bash

LOCAL_IP=127.0.0.1:9094

ZK_SERVER=127.0.0.1:2181/kafka
KAFKA_SERVER=127.0.0.1:9092
PARTITIONS=1

usage() {
  echo "------------------------------------------------------------------------"
  echo -e "生产数据\n"
  echo "交互式：kafka-operation.sh producer MOCK-DATA-SESSION-RECORD" | column -t
  echo "读取文件：kafka-operation.sh producer MOCK-DATA-SESSION-RECORD < mock_data.txt" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "消费数据\n"
  echo "从当前消费：kafka-operation.sh consumer MOCK-DATA-SESSION-RECORD" | column -t
  echo "从头消费：kafka-operation.sh consumer-begin MOCK-DATA-SESSION-RECORD" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "创建Topic\n"
  echo "kafka-operation.sh create-topic [topic name] [partition num] [replication num]" | column -t
  echo "样例：kafka-operation.sh create-topic MOCK-DATA-SESSION-RECORD 3 1" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "删除Topic\n"
  echo "kafka-operation.sh delete-topic [topic name]" | column -t
  echo "样例：kafka-operation.sh delete-topic MOCK-DATA-SESSION-RECORD" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "查看Topic列表\n"
  echo "kafka-operation.sh list" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "查看Topic详情\n"
  echo "kafka-operation.sh desc-topic [topic name]" | column -t  
  echo "样例：kafka-operation.sh desc-topic MOCK-DATA-SESSION-RECORD" | column -t  
  echo "------------------------------------------------------------------------"  
  echo -e "查看消费组列表\n"
  echo "kafka-operation.sh groups" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "查看消费组详情\n"
  echo "kafka-operation.sh desc-group [consumer group name]" | column -t  
  echo "样例：kafka-operation.sh desc-group etl-session-record-kafka-to-kafka" | column -t  
  echo "------------------------------------------------------------------------"
  echo -e "增加Topic分区\n"
  echo "kafka-operation.sh add-partition [topic name] [new partition num]" | column -t
  echo "样例：kafka-operation.sh add-partition MOCK-DATA-SESSION-RECORD 5" | column -t
  echo "------------------------------------------------------------------------"
  echo -e "Topic Leader平衡\n"
  echo "kafka-operation.sh election-leader" | column -t
  echo "------------------------------------------------------------------------"  
  echo -e "查看Quotas\n"
  echo "kafka-operation.sh desc-quota" | column -t
  echo "------------------------------------------------------------------------" 
  echo -e "增加Quotas\n"
  echo "kafka-operation.sh add-quota [quatos rule] [user] [client.id]" | column -t
  echo "kafka-operation.sh add-quota 'producer_byte_rate=10485760' tsg_olap SESSION-RECORD" | column -t
  echo "------------------------------------------------------------------------" 
  echo -e "删除Quotas\n"
  echo "kafka-operation.sh delete-quota [quatos rule] [user] [client.id]" | column -t
  echo "kafka-operation.sh delete-quota 'producer_byte_rate' tsg_olap SESSION-RECORD" | column -t
  echo "------------------------------------------------------------------------" 
}

if [ $# -eq 0 ]; then
  usage
  exit 0
fi

case $1 in
  producer)
    kafka-console-producer.sh --producer.config $KAFKA_HOME/config/producer.properties --broker-list $LOCAL_IP --topic $2
  ;;
  consumer)
    kafka-console-consumer.sh --consumer.config $KAFKA_HOME/config/consumer.properties --bootstrap-server $LOCAL_IP --topic $2
  ;;
  consumer-begin)
    kafka-console-consumer.sh --consumer.config $KAFKA_HOME/config/consumer.properties --from-beginning --bootstrap-server $LOCAL_IP --topic $2
  ;;
  create-topic)
    kafka-topics.sh --if-not-exists --create --bootstrap-server $KAFKA_SERVER --topic $2 --partitions $3 --replication-factor $4
  ;;  
  delete-topic)
    kafka-topics.sh --if-exists --delete --bootstrap-server $KAFKA_SERVER --topic $2
  ;;
  list)
    kafka-topics.sh --list --bootstrap-server $KAFKA_SERVER
  ;;
  desc-topic)
    kafka-topics.sh --if-exists --bootstrap-server $KAFKA_SERVER --describe --topic $2
  ;;
  groups)
    kafka-consumer-groups.sh --all-groups --all-topics --list --bootstrap-server $KAFKA_SERVER
  ;;
  desc-group)
    kafka-consumer-groups.sh --bootstrap-server $KAFKA_SERVER --describe --group $2
  ;;  
  add-partition)
    kafka-topics.sh --if-exists --bootstrap-server $KAFKA_SERVER --alter --topic $2 --partitions $3
  ;;
  election-leader)
    kafka-leader-election.sh --bootstrap-server $KAFKA_SERVER --all-topic-partitions --election-type PREFERRED
  ;;
  desc-quota)
    kafka-configs.sh --bootstrap-server  $KAFKA_SERVER  --describe --entity-type users  --entity-type clients 
  ;;
  add-quota) 
    kafka-configs.sh --bootstrap-server  $KAFKA_SERVER --alter --add-config  $2  --entity-type users --entity-name $3 --entity-type clients --entity-name $4
  ;;
  delete-quota)
    kafka-configs.sh --bootstrap-server  $KAFKA_SERVER --alter --delete-config  $2  --entity-type users --entity-name $3 --entity-type clients --entity-name $4
  ;;
  *)
  usage
esac

#!/bin/bash

sql_file=$1 # sql文件路径
operation=$2 # 1是批量查询，2是单条依次查询
startTime="'2024-01-28 15:11:32'"
endTime="'2024-01-29 15:11:32'"
query_batch=1 # 批量查询同时查询的数量
host=192.168.44.12
port=9001
user=default
password=galaxy2019
query_count=$(wc -l < "$sql_file")

if [ $operation -eq 1 ];then
  start_time=$(date +%s.%N)
  cat $sql_file | sed "s/start_time/$startTime/g" | sed "s/end_time/$endTime/g" | awk -F ';' '{print $2}' | clickhouse-benchmark -h $host -p $port --user=$user --password=$password -i $query_count -d 0 -c $query_batch
  end_time=$(date +%s.%N)
  total_time=$(echo $(printf "%.3f" "$(echo "scale=3; $end_time - $start_time" | bc)"))
  echo "Elapsed Time: $total_time seconds"
  echo "Avg Elapsed Time: $(echo $(printf "%.3f" "$(echo "scale=3; $total_time / $query_count" | bc)")) seconds"
  exit 0
else
  total_time=0
  set -f
  while IFS= read -r line
  do
    query=$(echo $line | sed "s/start_time/$startTime/g" | sed "s/end_time/$endTime/g")
    query_name=$(echo $query | awk -F ';' '{print $1}')
    sql=$(echo $query | awk -F ';' '{print $2}')
    query_time=$(clickhouse-client --host=$host --port=$port --user=$user --password=$password -t --query="$sql" 2>&1  >/dev/null)
    echo "Query: $query_name"
    echo "Elapsed Time: $query_time seconds"
    total_time=$(echo "$total_time + $query_time" | bc)
  done < $sql_file
  echo "Total Elapsed Time: $total_time seconds"
  echo "Avg Elapsed Time: $(echo $(printf "%.3f" "$(echo "scale=3; $total_time / $query_count" | bc)")) seconds"
  exit 0
fi

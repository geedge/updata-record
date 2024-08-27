#!/bin/bash

version="1.4"
jar="galaxy-hos-util-$version.jar"

usage() {
  cat <<EOF

Usage: ./hosutil.sh [command] [-h] [options...]

Available commands:
  download      Download individual or batch files
  upload        Upload individual or batch files
  check         Check file availability
  combiner      Verify if the file-chunk-combiner data stream is correct
  version       Print the version

Options for 'download' command:
  -b, --bucket        The bucket to access.
  -d, --directory     Directory to save files. If not exists, will be created. Default is ./download/.
  -k, --keys          Files to download. Can be a single or multiple files separated by commas.
  -p, --prefix        Prefix for batch downloading files based on file name.
  -s, --start_time    Start time in UTC format (yyyyMMdd, yyyy-MM-dd, yyyyMMddHHmmss). Default is the previous day's time.
  -e, --end_time      End time in UTC format (yyyyMMdd, yyyy-MM-dd, yyyyMMddHHmmss). Default is current time.
  -c, --count         Number of files to download. Default is 1000, maximum is 100000.
  -t, --threads       Number of threads. Default is 1, maximum is 10.

Options for 'upload' command:
  -b, --bucket        The bucket to access.
  -d, --directory     Directory where files to upload are located. Default is ./upload/.
  -t, --threads       Number of threads. Default is 1, maximum is 10.

Options for 'check' command:
  -s, --start_time    Start time in UTC format (yyyyMMdd, yyyy-MM-dd, yyyyMMddHHmmss). Default is the previous day's time.
  -e, --end_time      End time in UTC format (yyyyMMdd, yyyy-MM-dd, yyyyMMddHHmmss). Default is current time.
  -c, --count         Number of logs to evaluate. Default is 1000, maximum is 100000.
  -d, --data_center   Specify the data centers to evaluate, separated by commas. If not specified, all data centers are evaluated.
  -l, --log_type      Specify the logs to evaluate, separated by commas. If not specified, all logs are evaluated.
                      Supported logs: security_event, monitor_event, proxy_event, session_record, voip_record, assessment_event, transaction_record, troubleshooting.
  -f, --file_type     Specify file types. If not specified, all types are evaluated. Supported types: eml, http, pcap, other.
                      Only session_record, security_event, monitor_event, transaction_record support multiple types.
  -t --threads        Number of threads. Default is 1, maximum is 10.

Options for 'combiner' command:
  -j, --job           Job to verify. Options: traffic, troubleshooting. Default is traffic.(Troubleshooting job removed in version 24.05)

EOF
}

# 初始化默认值
bucket=""
directory=""
keys=""
prefix=""
start_time=""
end_time=""
count=1000
threads=1
log_type=""
file_type=""
data_center=""
job_name="traffic"

# 检查必填参数
check_required() {
  case "$operation" in
    download|upload)
      if [ -z "$bucket" ]; then
        echo "Error: bucket is required for $operation."
        exit 1
      fi
      ;;
    *)
      # 对于其他操作，不需要检查特定参数
      ;;
  esac
}

# 下载函数
download() {
  directory=${directory:-"./download/"}
  check_required
  java -jar $jar download $bucket $directory keys=$keys prefix=$prefix max_keys=$count time_range=$start_time/$end_time thread_num=$threads
}

# 上传函数
upload() {
  directory=${directory:-"./upload/"}
  check_required
  java -jar $jar upload $bucket $directory thread_num=$threads
}

# 检查函数
check() {
  java -jar $jar check data_center=$data_center log_type=$log_type file_type=$file_type max_logs=$count time_range=$start_time/$end_time thread_num=$threads
}

# 合并器函数
combiner() {
  java -jar $jar combiner $job_name
}

# 主操作流程
if [ $# -eq 0 ];then
  usage
  exit 0
fi

operation=$1
shift
while getopts ":h:b:d:k:p:s:e:c:t:l:f:j:" opt; do
  case $opt in
    h) usage; exit 0 ;;
    b) bucket=$OPTARG ;;
    d) if [ "$operation" == "check" ]; then data_center=$OPTARG; else directory=$OPTARG; fi ;;
    k) keys=$OPTARG ;;
    p) prefix=$OPTARG ;;
    s) start_time=$OPTARG ;;
    e) end_Time=$OPTARG ;;
    c) count=$OPTARG ;;
    t) threads=$OPTARG ;;
    l) log_type=$OPTARG ;;
    f) file_type=$OPTARG ;;
    j) job_name=$OPTARG ;;
    \?) echo "Invalid option: -$OPTARG" >&2; usage; exit 1 ;;
    :) echo "Option -$OPTARG requires an argument" >&2; usage; exit 1 ;;
  esac
done

case "$operation" in
  download) download ;;
  upload) upload ;;
  check) check ;;
  combiner) combiner ;;
  version) echo $version ;;
  *) usage; exit 1 ;;
esac


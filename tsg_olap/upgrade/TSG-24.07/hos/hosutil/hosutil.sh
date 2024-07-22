#!/bin/bash

usage() {
  echo "Usage: ./hosutil.sh [command] [-h] [options...]"
  echo "Available commands are:"
  echo "  download Download individual or batch files"
  echo "  upload Upload individual or batch files"
  echo "  check Check file availability"
  echo "  combiner Verify if the file-chunk-combiner data stream is correct"
  echo "  version Print the version"
  echo ""
  echo "download options:"
  echo "  -b --bucket 要访问的桶。"
  echo "  -d --directory 保存文件的路径，该路径不存在，将被创建，默认为./download/。"
  echo "  -k --keys 要下载的文件名，可以为单个文件或多个文件，多个文件以逗号隔开。"
  echo "  -p --prefix 根据文件名前缀批量下载文件时的文件名前缀。"
  echo "  -s --startTime 起始时间。时间是UTC时间，格式为yyyyMMdd、yyyy-MM-dd、yyyyMMddHHmmss，默认是前一天的时间。"
  echo "  -e --endTime 结束时间。时间是UTC时间，格式为yyyyMMdd、yyyy-MM-dd、yyyyMMddHHmmss，默认是当前时间。"
  echo "  -c --count 设置下载文件的数量，默认为1000，最大值为100000。"
  echo "  -t --threads 线程数，默认为1，最大值为10。"
  echo "upload options:"
  echo "  -b --bucket 要访问的桶。"
  echo "  -d --directory 上传文件所在的路径，默认为./upload/。"
  echo "  -t --threads 线程数，默认为1，最大值为10。"
  echo "check options:"
  echo "  -s --startTime 起始时间。时间是UTC时间，格式为yyyyMMdd、yyyy-MM-dd、yyyyMMddHHmmss，默认是前一天的时间。"
  echo "  -e --endTime 结束时间。时间是UTC时间，格式为yyyyMMdd、yyyy-MM-dd、yyyyMMddHHmmss，默认是当前时间。"
  echo "  -c --count 评估的日志数量，默认为1000，最大值为100000。"
  echo "  -l --logType 评估指定日志的文件，不指定该参数则评估所有日志，支持评估多种日志，使用逗号隔开，例如session_record,security_event。支持的日志有security_event、proxy_event、session_record、voip_record、assessment_event、transaction_record、troubleshooting。"
  echo "  -f --fileType 指定文件的类型，不指定该参数则为所有类型，例如pcap。目前类型有：mail、http、pcap、other。目前只有session_record（mail、http、pcap）、security_event（mail、http、pcap）、transaction_record（mail、http）包含多种类型，其他日志省略该参数即可。"
  echo "  -t --threads 线程数，默认为1，最大值为10。"
  echo "combiner options:"
  echo "  -j --job 要验证的任务，有traffic、troubleshooting、all，all为都验证，默认为all。"
  echo "  -p --prefix 文件名前缀，防止多次执行文件名重复，不可省略。"
}

if [ $# -eq 0 ]; then
  usage
  exit 0
fi

version="1.2"
operation=$1
bucket=""
directory=""
keys=""
prefix=""
startTime=""
endTime=""
count=1000
threads=1
logType=""
fileType=""
jobName="all"
jar="galaxy-hos-util-"$version".jar"

shift
while getopts ":h:b:d:k:p:s:e:c:t:l:f:j:" opt; do
  case $opt in
    h)
      usage
      exit 0
      ;;
    b)
      bucket=$OPTARG
      ;;
    d)
      directory=$OPTARG
      ;;
    k)
      keys=$OPTARG
      ;;
    p)
      prefix=$OPTARG
      ;;
    s)
      startTime=$OPTARG
      ;;
    e)
      endTime=$OPTARG
      ;;
    c)
      count=$OPTARG
      ;;
    t)
      threads=$OPTARG
      ;;
    l)
      logType=$OPTARG
      ;;
    f)
      fileType=$OPTARG
      ;;
    j)
      jobName=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument" >&2
      usage
      exit 1
      ;;
  esac
done

download() {
if [ -z "$directory" ]; then
  directory="./download/"
fi
java -jar $jar download $bucket $directory keys=$keys prefix=$prefix maxKeys=$count timeRange=$startTime/$endTime threadNum=$threads
}

upload() {
if [ -z "$directory" ]; then
  directory="./upload/"
fi
java -jar $jar upload $bucket $directory threadNum=$threads
}

check() {
java -jar $jar check logType=$logType fileType=$fileType maxLogs=$count timeRange=$startTime/$endTime threadNum=$threads
}

combiner() {
java -jar $jar combiner $jobName $prefix
}

if [ "$operation" = "download" ];then
  download
  exit 0
elif [ "$operation" = "upload" ];then
  upload
  exit 0
elif [ "$operation" = "check" ];then
  check
  exit 0
elif [ "$operation" = "combiner" ];then
  combiner
  exit 0
elif [ "$operation" = "version" ];then
  echo $version
  exit 0
else
  usage
  exit 0
fi



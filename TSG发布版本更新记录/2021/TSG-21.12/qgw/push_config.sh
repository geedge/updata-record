#!/bin/bash
#修改config_path_root路径为放置要上传nacos的配置，IP地址为nacos地址

config_path_root=/home/deploy/bak/galaxy-qgw-service/config
tenant="prod"
nacos_push_url="http://192.168.44.67:8848/nacos/v1/cs/configs?username=nacos&password=nacos&tenant=$tenant&group=Galaxy"
retry=3

#1.获取config 路径
config_path_list=$(readlink -f $config_path_root)

function pushConfig(){
#2.app文件夹文件
for config_path in  $config_path_list
do
 if [ -d $config_path ];then
 appPath=${config_path%/*}
 appName=${appPath##*/}
 for file in `ls $config_path`
 do
  config_path_file=$config_path/$file
  if [ -f $config_path_file ];then
   data_id=${config_path_file##*/}
   suffix=${config_path_file##*.}
   if [ "$suffix" = "sql" ];then
    suffix="text"
   fi
   if [ "$suffix" = "yml" ];then
    suffix="yaml"
   fi

   for (( i = 0; i < 3; i++ )); do
     if [ "$suffix" = "yaml" ]||[ "$suffix" = "json" ]||[ "$suffix" = "text" ]||[ "$suffix" = "properties" ];then
      result=$(curl -sw '%{http_code}' -o /dev/null --request POST "$nacos_push_url&dataId=$data_id&appName=$appName&type=$suffix"  --data-urlencode content="`cat $config_path_file`")
        echo "push config response code "$result
       if [[ $result -eq '200' ]];then
        i=3
       fi
     fi
   done

  fi
 done
 fi
done
}

pushConfig

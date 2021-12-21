#!/bin/bash

nacos_server="192.168.44.12"
tenant="prod"
group_id="Galaxy"
app_name="galaxy-qgw-service"
username="nacos"
password="nacos"

#放置备份配置的目录
backup_config_path=/home/tmp/21.11

search_config_url="http://$nacos_server:8848/nacos/v1/cs/configs?dataId=&group=${group_id}&appName=$app_name&username=$username&password=$password&tenant=$tenant&search=accurate&pageNo=1&pageSize=10000"

backup_config_ids=$(curl -X GET $search_config_url|jq -r .pageItems[].dataId)

array=(${backup_config_ids//,/ })
if [ ! -d $backup_config_path ];then
  mkdir -p $backup_config_path
fi

for data_id in ${array[@]}
do
   config_url="http://$nacos_server:8848/nacos/v1/cs/configs?dataId=$data_id&group=$group_id&appName=$app_name&username=$username&password=$password&tenant=$tenant"

   #备份
   curl $config_url >  $backup_config_path/$data_id

done

   #`curl -X DELETE $config_url`

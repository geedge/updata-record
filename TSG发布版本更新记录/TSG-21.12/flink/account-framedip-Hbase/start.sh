#! /bin/bash
#启动storm任务脚本
source /etc/profile
#任务jar所在目录
BASE_DIR=`pwd`
#jar name
JAR_NAME='radius-relation-21-12-06.jar'

#cd $BASE_DIR
jar -xvf $BASE_DIR/$JAR_NAME service_flow_config.properties
function read_dir(){
        for file in `ls $1` #注意此处这是两个反引号，表示运行系统命令
 do
        if [ -d $1"/"$file ] #注意此处之间一定要加上空格，否则会报错
                then
                        read_dir $1"/"$file
                else
	num=`flink list | grep "$file" | wc -l`
	       	if [ $num -eq "0" ];then
       		cat $1$file > $BASE_DIR/service_flow_config.properties
       		jar -uvf $BASE_DIR/$JAR_NAME service_flow_config.properties
                flink run -d  -p 1 $JAR_NAME
                fi
	fi
done
}
if [ $# != 1 ];then
    echo "usage: ./startall.sh [Configuration path]"
    exit 1
fi
#读取第一个参数 为配置文件目录名称
read_dir $1


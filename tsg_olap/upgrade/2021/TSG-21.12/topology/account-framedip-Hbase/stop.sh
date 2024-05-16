#!/bin/bash
#flink任务停止脚本
source /etc/profile


function read_dir(){
        for file in `ls $1` #注意此处这是两个反引号，表示运行系统命令
 do
        if [ -d $1"/"$file ] #注意此处之间一定要加上空格，否则会报错
                then
                    read_dir $1"/"$file
                else
                jobid=`flink list | grep "$file" | awk '{print $4}'`
                flink cancel $jobid
        fi
done
}
#读取第一个参数 为配置文件目录名
read_dir $1                 

#!/bin/bash
home=$(cd `dirname $0`; pwd)

# 遍历每个节点执行迁移
for ip in `cat iplist.txt`
do
    # 后台执行，输出日志
    echo "$ip节点"
    ssh $ip "[ ! -d $home ] && mkdir -p $home"
    scp -r $home/*local_table_to_2411.sh $ip:$home/
    ssh $ip "cd $home && chmod +x ./*.sh"
    echo ""
done


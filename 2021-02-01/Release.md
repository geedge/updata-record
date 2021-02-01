# TSG-V21.02版本 2021-02-01更新记录


## galaxy-qgw-service

镜像版本：v3.3.210201

>docker pull 192.168.40.153:9080/tsg/galaxy/galaxy-qgw-service:v3.3.210201

更新内容：
* 新增： 
  
  1.查询SQL任务执行状态。  
  2.获取当前SQL Query ID。  
  
* 修复：
  
  1：[TSG-5494、TSG-5465] LiveCharts 协议分布数据接口，过滤异常数据。   
  2：[TSG-5467] 修复代码可满足EAL4检测评分并合并到主分支。  
  3：[TSG-5448] - 支持 TCP ISN 的显示与原始日志检索。  
  4: 重命名系统配置文件属性，将clickhouse 配置文件 passwod 改为 userKey。  


## Clickhouse

更新内容：
* 新增：
 
   1：[TSG-5448] - 支持 TCP ISN 的显示与原始日志检索。  
nacos conf下application.properties

jdbc配置增加

&failOverReadOnly=false

修改完成后重启nacos集群生效

命令
service keepnacosalive stop
service keepnacosalive start
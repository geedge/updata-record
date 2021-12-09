# 更新的时候，先停掉之前的任务，然后执行sql，最后再提交新任务

DELETE FROM druid.druid_pendingsegments WHERE dataSource = 'traffic_app_stat_log';

DELETE FROM druid.druid_datasource WHERE dataSource = 'traffic_app_stat_log';
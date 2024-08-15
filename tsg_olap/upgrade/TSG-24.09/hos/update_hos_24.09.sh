curl -X PUT http://{{ vrrp_instance.oss.virtual_ipaddress }}:9098/hos/traffic_policy_capture_file_bucket -H 'token:{{ hos_token }}' -H 'x-hos-region-count:64*hbase服务器数' -H 'x-hos-ttl:30' -H 'x-hos-replication:1'
curl -X PUT http://{{ vrrp_instance.oss.virtual_ipaddress }}:9098/hos/traffic_rtp_file_bucket -H 'token:{{ hos_token }}' -H 'x-hos-region-count:64*hbase服务器数' -H 'x-hos-ttl:30' -H 'x-hos-replication:1'
curl -X PUT http://{{ vrrp_instance.oss.virtual_ipaddress }}:9098/hos/traffic_http_file_bucket -H 'token:{{ hos_token }}' -H 'x-hos-region-count:64*hbase服务器数' -H 'x-hos-ttl:30' -H 'x-hos-replication:1'
curl -X PUT http://{{ vrrp_instance.oss.virtual_ipaddress }}:9098/hos/traffic_eml_file_bucket -H 'token:{{ hos_token }}' -H 'x-hos-region-count:16' -H 'x-hos-ttl:30' -H 'x-hos-replication:1'

curl -X DELETE http://{{ vrrp_instance.oss.virtual_ipaddress }}:9098/hos/traffic_file_bucket -H 'token:{{ hos_token }}'
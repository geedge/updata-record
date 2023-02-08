#!/bin/bash

source /etc/profile

phoenix_path=/home/bigdata/hbase-2.2.3/bin/

hbase shell <<EOF

create 'tsg_galaxy:relation_user_teid',{NAME=>'gtp'}
create 'tsg_galaxy:gtpc_knowledge_base',{NAME => 'gtp',TTL=> '604800'}

EOF

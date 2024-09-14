docker exec -i HMaster hbase shell <<EOF
alter 'troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_time_troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_filename_troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_partfile_troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_time_assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_filename_assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_partfile_assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}

EOF

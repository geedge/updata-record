alter 'troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_time_troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_filename_troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_partfile_troubleshooting_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}

alter 'assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_time_assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_filename_assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}
alter 'index_partfile_assessment_file_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '1'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '1'}}

alter 'knowledge_base_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
alter 'index_time_knowledge_base_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
alter 'index_filename_knowledge_base_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
alter 'index_partfile_knowledge_base_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}

alter 'report_snapshot_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
alter 'index_time_report_snapshot_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
alter 'index_filename_report_snapshot_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
alter 'index_partfile_report_snapshot_bucket',{NAME => 'data',METADATA => {'DFS_REPLICATION' => '2'}},{NAME => 'meta', METADATA => {'DFS_REPLICATION' => '2'}}
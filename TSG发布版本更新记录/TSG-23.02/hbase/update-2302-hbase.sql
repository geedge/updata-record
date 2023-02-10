disable "tsg_galaxy:job_result"
alter "tsg_galaxy:job_result",NAME=>'detail',TTL=>'1800'
alter "tsg_galaxy:job_result",NAME=>'statistics',TTL=>'1800'
alter "tsg_galaxy:job_result",NAME=>'field_discovery',TTL=>'1800'
enable "tsg_galaxy:job_result"

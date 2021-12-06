ALTER  table tsg_galaxy_v3.radius_record_local on cluster ck_cluster add column IF NOT EXISTS radius_acct_authentic Int64 after radius_acct_interim_interval;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_cluster add column IF NOT EXISTS radius_acct_authentic Int64 after radius_acct_interim_interval;
ALTER  table tsg_galaxy_v3.radius_record on cluster ck_query add column IF NOT EXISTS radius_acct_authentic Int64 after radius_acct_interim_interval;

select 'session_record_old' as table_name, count(*) as cnt from tsg_galaxy_tmp.session_record_old;

select 'security_event_old' as table_name, count(*) as cnt from tsg_galaxy_tmp.security_event_old;

select 'transaction_record_old' as table_name, count(*) as cnt from tsg_galaxy_tmp.transaction_record_old;

select 'voip_record_old' as table_name, count(*) as cnt from tsg_galaxy_tmp.voip_record_old;

select 'proxy_event_old' as table_name, count(*) as cnt from tsg_galaxy_tmp.proxy_event_old;

select 'dos_event_old' as table_name, count(*) as cnt from tsg_galaxy_tmp.dos_event_old;
select 'session_record' as table_name, count(*) as cnt from tsg_galaxy_v3.session_record;

select 'security_event' as table_name, count(*) as cnt from tsg_galaxy_v3.security_event;

select 'transaction_record' as table_name, count(*) as cnt from tsg_galaxy_v3.transaction_record;

select 'voip_record' as table_name, count(*) as cnt from tsg_galaxy_v3.voip_record;

select 'proxy_event' as table_name, count(*) as cnt from tsg_galaxy_v3.proxy_event;

select 'dos_event' as table_name, count(*) as cnt from tsg_galaxy_v3.dos_event;
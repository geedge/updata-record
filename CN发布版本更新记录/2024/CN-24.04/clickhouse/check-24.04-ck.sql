SELECT subscriber_id, imei, imsi, phone_number, apn, subscriber_longitude, subscriber_latitude, first_location, second_location, third_location,data_source,  stat_time
FROM cyber_narrator_galaxy.location_subscriber where stat_time >= toUnixTimestamp('2030-01-01 00:00:00') AND stat_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT app_name, `domain`, ip, ip_country_region, ip_super_admin_area, ip_admin_area, ip_asn, ip_isp, domain_category_name, domain_category_group, app_category, app_subcategory, entity_tags, create_time, update_time
FROM cyber_narrator_galaxy.session_relation_domain_ip_app where create_time >= toUnixTimestamp('2030-01-01 00:00:00') AND create_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT app_name ,domain ,ip ,ip_country_region ,ip_super_admin_area ,ip_admin_area ,ip_asn ,ip_isp ,domain_category_name ,domain_category_group ,app_category ,app_subcategory ,entity_tags ,stat_time 
FROM cyber_narrator_galaxy.raw_session_relation_domain_ip_app where stat_time >= toUnixTimestamp('2030-01-01 00:00:00') AND stat_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT ip, l7_protocol, port, stat_time
FROM cyber_narrator_galaxy.raw_cn_ip_dynamic_attribute where stat_time >= toUnixTimestamp('2030-01-01 00:00:00') AND stat_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT  app_name,  subscriber_id,  imei,  imsi,  phone_number,  apn,  app_category,  app_subcategory,  create_time,  update_time
FROM cyber_narrator_galaxy.session_relation_subscriber_app where create_time >= toUnixTimestamp('2030-01-01 00:00:00') AND create_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT  app_name ,subscriber_id ,imei ,imsi ,phone_number ,apn ,app_category ,app_subcategory ,stat_time 
FROM cyber_narrator_galaxy.raw_session_relation_subscriber_app where stat_time >= toUnixTimestamp('2030-01-01 00:00:00') AND stat_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT app_name, `domain`, ip, ip_country_region, ip_super_admin_area, ip_admin_area, ip_asn, ip_isp, domain_category_name, domain_category_group, app_category, app_subcategory, entity_tags, create_time, update_time
FROM cyber_narrator_galaxy.session_relation_domain_ip_app_view_metric where create_time >= toUnixTimestamp('2030-01-01 00:00:00') AND create_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT app_name,subscriber_id,imei,imsi,phone_number,apn,app_category,app_subcategory,create_time,update_time
FROM cyber_narrator_galaxy.session_relation_subscriber_app_view_metric where create_time >= toUnixTimestamp('2030-01-01 00:00:00') AND create_time <toUnixTimestamp('2030-01-01 00:00:01');
SELECT ip, l7_protocol, port, create_time, update_time
FROM cyber_narrator_galaxy.cn_ip_dynamic_attribute_view_metric where create_time >= toUnixTimestamp('2030-01-01 00:00:00') AND create_time <toUnixTimestamp('2030-01-01 00:00:01');
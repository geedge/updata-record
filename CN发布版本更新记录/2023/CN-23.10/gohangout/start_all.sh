#!/bin/sh

STARTDIR=$(cd $(dirname $0); pwd)
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_security_event_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_ip_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_region_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_asn_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_application_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_domain_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_protocol_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_link_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_qname_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_server_ip_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_qtype_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_rcode_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_rr_a_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_rr_aaaa_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_dns_rr_cname_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_relation_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_ip_dynamic_attribute_cn.sh $1 > /dev/null 2>&1 &
$STARTDIR/bin/ghoStart/start_gohangout_k2ck_cn_record.sh $1
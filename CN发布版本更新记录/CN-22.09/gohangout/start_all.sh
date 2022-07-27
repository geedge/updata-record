#!/bin/sh

STARTDIR=$(cd $(dirname $0); pwd)

nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_connection_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_cn_record.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_ip_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_region_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_asn_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_idc_renter_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_application_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_domain_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_http_host_cn.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_ssl_sni_cn.sh $1 > /dev/null 2>&1 &
$STARTDIR/bin/ghoStart/start_gohangout_k2ck_metric_protocol_cn.sh $1

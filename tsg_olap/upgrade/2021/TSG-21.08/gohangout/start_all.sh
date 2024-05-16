#!/bin/sh

STARTDIR=$(cd $(dirname $0); pwd)

#docker模式
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_active_defence_event_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_connection_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_proxy_event_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_radius_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_radius_onff_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_sys_packet_capture_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_voip_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_gtpc_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_live_session_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_transaction_record_log_tsgv3.sh $1 > /dev/null 2>&1 &
nohup $STARTDIR/bin/ghoStart/start_gohangout_k2ck_dos_event_log_tsgv3.sh $1 > /dev/null 2>&1 &
$STARTDIR/bin/ghoStart/start_gohangout_k2ck_security_event_log_tsgv3.sh $1

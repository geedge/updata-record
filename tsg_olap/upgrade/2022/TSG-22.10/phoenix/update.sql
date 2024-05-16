DROP view IF EXISTS "tsg_galaxy"."gtpc_knowledge_base";
CREATE view IF NOT EXISTS "tsg_galaxy"."gtpc_knowledge_base"(
ROWKEY VARCHAR PRIMARY KEY,
"common"."vsys_id" UNSIGNED_INT,
"gtp"."teid" UNSIGNED_LONG,
"gtp"."uplink_teid" UNSIGNED_LONG,
"gtp"."downlink_teid" UNSIGNED_LONG,
"gtp"."apn" VARCHAR,
"gtp"."phone_number" VARCHAR,
"gtp"."imsi" VARCHAR,
"gtp"."imei" VARCHAR,
"gtp"."msg_type" UNSIGNED_INT,
"gtp"."last_update_time" UNSIGNED_LONG); 


DROP view IF EXISTS "tsg_galaxy"."relation_account_framedip";
CREATE view IF NOT EXISTS "tsg_galaxy"."relation_account_framedip"(
ROWKEY VARCHAR PRIMARY KEY,
"common"."vsys_id" UNSIGNED_INT,
"radius"."account" VARCHAR,
"radius"."framed_ip" VARCHAR,
"radius"."first_found_time" UNSIGNED_LONG,
"radius"."last_update_time" UNSIGNED_LONG,
"radius"."acct_status_type" UNSIGNED_INT);
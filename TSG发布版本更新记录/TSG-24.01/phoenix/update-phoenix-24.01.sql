DROP view IF EXISTS "tsg"."report_result";
DROP schema IF EXISTS "tsg";

CREATE view IF NOT EXISTS "tsg_galaxy"."saved_query_result"( ROWKEY VARCHAR PRIMARY KEY, "detail"."excute_sql" VARCHAR, "detail"."read_rows" UNSIGNED_LONG, "detail"."result_id" UNSIGNED_INT, "response"."result" VARCHAR);

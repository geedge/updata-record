CREATE schema IF NOT EXISTS "tsg_galaxy";

CREATE view IF NOT EXISTS "tsg_galaxy"."saved_query_result"( ROWKEY VARCHAR PRIMARY KEY, "detail"."excute_sql" VARCHAR, "detail"."read_rows" UNSIGNED_LONG, "detail"."result_id" UNSIGNED_INT, "response"."result" VARCHAR);

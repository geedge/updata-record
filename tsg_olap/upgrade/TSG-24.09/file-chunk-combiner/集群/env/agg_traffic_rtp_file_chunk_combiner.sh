#!/usr/bin/env bash

export MAIN_CLASS="com.zdjizhi.FileChunkCombiner"
export PARALLELISM="3"
export TASK_MODE="yarn-per-job"

export FLINK_JOB_OPTS="
-Djobmanager.memory.process.size=1024m
-Dtaskmanager.memory.process.size=2048m
-Dtaskmanager.numberOfTaskSlots=3
-Dtaskmanager.memory.framework.off-heap.size=256m
-Dtaskmanager.memory.jvm-metaspace.size=128m
"


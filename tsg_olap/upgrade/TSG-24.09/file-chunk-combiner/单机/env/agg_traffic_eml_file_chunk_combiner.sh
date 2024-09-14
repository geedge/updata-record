#!/usr/bin/env bash

export MAIN_CLASS="com.zdjizhi.FileChunkCombiner"
export PARALLELISM="1"
export TASK_MODE="yarn-session"

export FLINK_JOB_OPTS="
-Djobmanager.memory.process.size=1024m
-Dtaskmanager.memory.process.size=1024m
-Dtaskmanager.numberOfTaskSlots=1
-Dtaskmanager.memory.framework.off-heap.size=256m
-Dtaskmanager.memory.jvm-metaspace.size=128m
"


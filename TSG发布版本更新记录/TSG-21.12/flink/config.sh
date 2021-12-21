#flink bin/config.sh中临时目录设置，用于存放进程id

DEFAULT_ENV_PID_DIR="$(cd "`dirname "$0"`"/..; pwd)/tmp"
#!/bin/sh

source /lib/sh/logging.sh $DDE_LOG_DIR
source /lib/sh/common.sh
source /lib/sh/checks.sh



Log_Open

run_func 0 "bash $DDE_BLD_DIR/build.sh"

run_func 0 "cp $DDE_CONF_DIR/docker-compose.yaml $DDE_DCV_DIR"



#Run docker-compose
cd $DDE_DCV_DIR
run_func 0 "docker compose -p devenv up -d --force-recreate"

Log_Close



#!/bin/sh

source /lib/sh/logging.sh $DDE_LOG_DIR
source /lib/sh/common.sh
source /lib/sh/checks.sh

Log_Open

#devenv docker image build
cd $DDE_CONF_DIR/devenv/
run_func 0 "sudo docker build -t devenv -f $DDE_CONF_DIR/devenv/Dockerfile ."

Log_Close
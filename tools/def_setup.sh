#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf  https://raw.githubusercontent.com/0p553cd3v/Bash-common-lib/master/tools/install.sh | bash

export USR_CONF_DIR=$HOME/.config/
export USR_LOG_DIR=$HOME/.config/
export DDE_TLS_DIR="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
export DDE_REPO_DIR="$(dirname -- "$(readlink -f "$DDE_TLS_DIR")")"
export DDE_BLD_DIR=$DDE_REPO_DIR/build
export DDE_SRC_DIR=$DDE_REPO_DIR/src
export DDE_CONF_DIR=$USR_CONF_DIR/devenv/
export DDE_LOG_DIR=$USR_LOG_DIR/devenv/
export DDE_DIR=$HOME/docker-volumes/
export DDE_DCV_DIR=$DCV_DIR/devenv/

source /lib/sh/logging.sh $DDE_LOG_DIR
source /lib/sh/common.sh
source /lib/sh/checks.sh

Log_Open

enotify "Home: $HOME"
enotify "User: $USER"
enotify "Source dir: $DDE_SRC_DIR"
enotify "Build dir: $DDE_BLD_DIR"
enotify "Config dir: $DDE_CONF_DIR"
enotify "Log dir: $DDE_LOG_DIR"
enotify "General Docker volumes dir: $DDE_DIR"
enotify "Docker volumes dir: $DDE_DCV_DIR"

create_file ~/.bash_profile
add_line_to_file "export USR_CONF_DIR=$USR_CONF_DIR" ~/.bash_profile "export USR_CONF_DIR"
add_line_to_file "export USR_LOG_DIR=$USR_LOG_DIR" ~/.bash_profile "export USR_LOG_DIR"
add_line_to_file "export DDE_REPO_DIR=$DDE_REPO_DIR" ~/.bash_profile "export DDE_REPO_DIR"
add_line_to_file "export DDE_TLS_DIR=$DDE_TLS_DIR" ~/.bash_profile "export DDE_TLS_DIR"
add_line_to_file "export DDE_BLD_DIR=$DDE_BLD_DIR" ~/.bash_profile "export DDE_BLD_DIR"
add_line_to_file "export DDE_SRC_DIR=$DDE_SRC_DIR" ~/.bash_profile "export DDE_SRC_DIR"
add_line_to_file "export DDE_CONF_DIR=$DDE_CONF_DIR" ~/.bash_profile "export DDE_CONF_DIR"
add_line_to_file "export DDE_LOG_DIR=$DDE_LOG_DIR" ~/.bash_profile "export DDE_LOG_DIR"
add_line_to_file "export DDE_DCV_DIR=$DDE_DCV_DIR" ~/.bash_profile "export DDE_DCV_DIR"
add_line_to_file "export DCV_DIR=$DCV_DIR" ~/.bash_profile "export DCV_DIR"

source ~/.bash_profile
check_if_fail

#create base directories
create_dir "$USR_CONF_DIR"
create_dir "$USR_LOG_DIR"
create_dir "$DDE_CONF_DIR"
create_dir "$DDE_CONF_DIR/ubuntu"
create_dir "$DDE_LOG_DIR"
create_dir "$DCV_DIR"
create_dir "$DDE_DCV_DIR"
create_dir "$DDE_DCV_DIR/ubuntu"

copy_file $DDE_BLD_DIR/docker-compose.yaml $DDE_CONF_DIR
copy_file $DDE_SRC_DIR/ubuntu/Dockerfile $DDE_CONF_DIR/devenv/ubuntu
copy_file $DDE_REPO_DIR/config/ubuntu/x11vnc.service $DDE_CONF_DIR/ubuntu

if [[ $1 -eq null ]]; then
	echo -e "\033[0;33m !!! Before running main script please modify or append config files in $HOME/.config/devenv/!!\0033[0m"
	read -p "Press [Enter] key reboot."
	#Reboot
	sudo reboot
fi

Log_Close
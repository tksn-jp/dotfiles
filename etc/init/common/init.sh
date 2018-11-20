#!/bin/sh

common_init() {
	local SCRIPT_DIR=$(cd $(dirname $0); pwd)
	sh $SCRIPT_DIR/fisher.sh
	sh $SCRIPT_DIR/pip3.sh
	sh $SCRIPT_DIR/nvim-settings.sh
	sh $SCRIPT_DIR/tmuxinator.sh
}

common_init


#!/bin/sh

nvim_init() {
	local SCRIPT_DIR=$(cd $(dirname $0); pwd)
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $SCRIPT_DIR/../../.vim/dein/installer.sh
	sh $SCRIPT_DIR/../../../.vim/dein/installer.sh $SCRIPT_DIR/../../../.vim/dein/
}

nvim_init


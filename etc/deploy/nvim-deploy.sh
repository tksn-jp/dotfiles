#!/bin/sh

local SCRIPT_DIR=$(cd $(dirname $0); pwd)

########### link vim
if [ `which nvim` ]; then
	if [ ! -d $HOME/.config/nvim/ ]; then
		mkdir $HOME/.config/nvim
	fi
	ln -sf $HOME/.vimrc $HOME/.config/nvim/init.vim
fi


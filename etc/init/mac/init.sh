#!/bin/sh

mac_init() {
	local SCRIPT_DIR=$(cd $(dirname $0); pwd)

	sh $SCRIPT_DIR/brew.sh
	sh $SCRIPT_DIR/formura.sh
}

mac_init


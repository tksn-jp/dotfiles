#!/bin/sh

detect_platform() {

	local UNAME=`uname`
	local SCRIPT_DIR=$(cd $(dirname $0); pwd)

	if [ "$UNAME" = "Darwin" ]; then
		# for macOS
		sh $SCRIPT_DIR/mac/init.sh
	elif [ "$UNAME" = "Linux" ]; then
		# for Linux
		# sh $SCRIPT_DIR/linux/init.sh
		echo "Any scripts to init Linux have not been implemented."
		echo "Initiation exit."
		exit
	elif [ "$UNAME" = "BSD" ]; then
		# for BSD
		# sh $SCRIPT_DIR/bsd/init.sh
		echo "Any scripts to init BSDhave not been implemented."
		echo "Initiation exit."
		exit
	else
		# unknown platform
		echo "I don't know where is it..."
		echo "Any install have not been executed."
		exit
	fi

}

run_common_init() {
	# common install
	local SCRIPT_DIR=$(cd $(dirname $0); pwd)
	sh $SCRIPT_DIR/common/init.sh
}

detect_platform
run_common_init


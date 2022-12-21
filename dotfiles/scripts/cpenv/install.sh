#!/bin/bash

dependency_check() {
	local message='is not installed, Please install it to use this tool.'
	if ! [ -x "$(command -v awk)" ]; then
		echo "Error: awk $message" >&2
		exit 1
	elif ! [ -x "$(command -v xclip)" ]; then
		echo "Error: xclip $message" >&2
		exit 1
	else
		echo "All checks passed, proceeding with installation"
	fi
}

dependency_check

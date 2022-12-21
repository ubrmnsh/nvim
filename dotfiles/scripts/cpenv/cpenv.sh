#!/bin/bash

help() {
	echo "
  █▀▀ █▀█ █▀▀ █▄░█ █░█
  █▄▄ █▀▀ ██▄ █░▀█ ▀▄▀"
	echo ""
	echo " Usage: cpenv [ -f | --file ] [ -k | --key-to-search ] [ -s | --separator ]"
	exit 2
}

# if [[ $# -eq 0 ]]; then
# 	help
# fi

while [ $# -gt 0 ]; do
	case "$1" in
	--file* | -f*)
		if [[ "$1" != *=* ]]; then shift; fi
		FILENAME="${1#*=}"
		;;
	--key-to-search* | -k*)
		if [[ "$1" != *=* ]]; then shift; fi
		KEY_TO_SEARCH="${1#*=}"
		;;
	--separator* | -s*)
		if [[ "$1" != *=* ]]; then shift; fi
		SEPARATOR="${1#*=}"
		;;
	--help | -h)
		help
		exit 0
		;;
	*)
		printf "Error: not a valid arguement\n"
		exit 1
		;;
	esac
	shift
done

# echo $FILENAME, $KEY_TO_SEARCH, $SEPARATOR

SEARCHED_KEY=$(awk -F$SEPARATOR '{ print $1 }' $FILENAME)
SEARCHED_VALUE=$(awk -F$SEPARATOR '{ print $2 }' $FILENAME)

# echo $SEARCHED_VALUE | xclip -selection primary -r
# COPIED_VALUE=$(xclip -o -selection primary)
# echo "Copied => " $COPIED_VALUE "from " $SEARCHED_KEY

# printf "Installing cpenv to /usr/local/bin, needs user permission (Yy/Nn) "
# read user_permisssion_value

# if [[ $(expr length "$user_permission_value") -eq 0 ]]; then
# 	echo "Denied, sorry, can't proceed!"
# 	exit 1
# else
# 	echo "Installing cpenv."
# fi

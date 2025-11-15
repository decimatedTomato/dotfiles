#!/usr/bin/env bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

get_linux_distro_name() {
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		return $NAME
	else
		echo 'Could not get OS name'
		exit 1
	fi
}

ask() {
	while true; do
		read -p "$1 ([y]/n) " -r
		reply=${reply:-"y"}
		if [[ $reply =~ ^[Yy]$ ]]; then
			return 1
		elif [[ $reply =~ ^[Nn]$ ]]; then
			return 0
		fi
	done
}

insert_dotfile() {
	[ -f ~/$1 ] && mv ~/$1 ~/"$1"_local
	ln -s $1 ~/$1
}

case "$(uname -sr)" in
	Linux*)
		# Special keybinds for mac keyboard
		ask "Are you using a regular (not apple) keyboard?" \
			&& source script_dir/setup_linux.sh
			|| source script_dir/setup_linux_mac.sh
		;;
	Darwin*)
		source script_dir/setup_osx.sh
		;;
	Linux*Microsoft*)
		source script_dir/setup_wsl.sh
		;;
	CYGWIN*|MINGW*|MINGW32*|MSYS*)
		source script_dir/setup_msys.sh
		;;
	*)
		echo 'Unrecognized OS'
		exit 1
		;;
esac

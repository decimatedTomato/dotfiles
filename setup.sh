#!/usr/bin/env bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

all_installed() {
	for binary in "$@"; do
		command -v "$binary" || return 1
	done
}

ask() {
	local bold
	bold=$(tput bold)
	local normal
	normal=$(tput sgr0)
	local prompt
	prompt="${1/'*'/${bold}}"
	prompt="${prompt/'*'/${normal}}"
	while true; do
		read -p "$prompt ([y]/n) " -r reply
		reply=${reply:-"y"}
		if [[ $reply =~ ^[Yy]$ ]]; then
			return 0
		elif [[ $reply =~ ^[Nn]$ ]]; then
			return 1
		fi
	done
}

insert_dotfile() {
	ln -sf "$script_dir"/"$1" ~/"${2:-"$1"}"
}

case "$(uname -sr)" in
	Linux*Microsoft*)
		source "$script_dir"/setup_linux.sh
		source "$script_dir"/setup_wsl.sh
		;;
	Linux*)
		source "$script_dir"/setup_linux.sh
		ask "Are you using a regular (not apple) keyboard?" \
			|| source "$script_dir"/setup_mac.sh
		;;
	Darwin*)
		source "$script_dir"/setup_osx.sh
		source "$script_dir"/setup_mac.sh
		;;
	CYGWIN*|MINGW*|MSYS*)
		source "$script_dir"/setup_msys.sh
		;;
	*)
		echo 'Unrecognized OS'
		exit 1
		;;
esac

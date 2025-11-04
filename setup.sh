#!/usr/bin/env bash

case "$(uname -sr)" in
	Darwin*)
		echo 'Mac OS X'
		setup_osx.sh
		;;
	Linux*Microsoft*)
		echo 'WSL'
		setup_wsl.sh
		;;
	Linux*)
		echo 'Linux'
		# Special keybinds for mac keyboard
		if [ $1 = '--mac' ]; then dotfiles_linux/setup_mac.sh
		else setup_linux.sh
		fi
		;;
	CYGWIN*|MINGW*|MINGW32*|MSYS*)
		echo 'MS Windows'
		setup_msys.sh
		;;
	*)
		echo 'Unrecognized OS'
		;;
esac

cat << EOF
Now use:
git config --global user.name <your github account name>
git config --global user.email <your github associated email>
EOF

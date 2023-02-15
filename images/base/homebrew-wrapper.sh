#!/bin/sh

brew_bin="/home/linuxbrew/.linuxbrew/bin/brew"
prefix="WARNING: "
if [ -t 1 ]; then
  # If stdout is a terminal, use color.
  prefix="\033[1;33m${prefix}\033[0m"
fi

warning() {
    echo "${prefix}Homebrew in Coder images is deprecated and will be removed at the end of March 2023." 1>&2
}

warning
echo
"$brew_bin" "$@"
echo
warning

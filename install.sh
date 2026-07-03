#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$SCRIPT_DIR/.SciTEUser.properties" ~/.SciTEUser.properties
cp "$SCRIPT_DIR/.vimrc" ~/.vimrc
cp "$SCRIPT_DIR/rebase_from.sh" ~/.rebase_from.sh
echo "Copied config and script files to home dir"

BASHRC_EXTRAS_PATH="$SCRIPT_DIR/.bashrc_extras"

# target bashrc
BASHRC="$HOME/.bashrc"

# markers to ensure idempotence
MARKER_START="# >>> .bashrc_extras start >>>"
MARKER_END="# <<< .bashrc_extras end <<<"

# ensure ~/.bashrc exists
if [ ! -f "$BASHRC" ]; then
	echo "Error: ~/.bashrc not found"
	exit 1
fi

# if already installed, do nothing
if grep -Fq "$MARKER_START" "$BASHRC" 2>/dev/null; then
	echo "Sourcing block already present in $BASHRC"
	exit 0
fi

# warn if the extras file doesn't exist
if [ ! -f "$BASHRC_EXTRAS_PATH" ]; then
	echo "Error: $BASHRC_EXTRAS_PATH does not exist"
	exit 1
fi

# append sourcing block surrounded by blank lines
echo >>$BASHRC
echo $MARKER_START >>$BASHRC
echo "if [ -f \"$BASHRC_EXTRAS_PATH\" ]; then" >>$BASHRC
echo "    . \"$BASHRC_EXTRAS_PATH\"" >>$BASHRC
echo "fi" >>$BASHRC
echo $MARKER_END >>$BASHRC
echo >>$BASHRC

echo "Appended sourcing block to $BASHRC"

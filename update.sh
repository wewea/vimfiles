#!/bin/bash

mkdir vimfiles
UPLOAD_FILE="$HOME/.vim/dict"
UPLOAD_FILE="$UPLOAD_FILE $HOME/.vim/colors"
UPLOAD_FILE="$UPLOAD_FILE $HOME/.vimrc"
UPLOAD_FILE="$UPLOAD_FILE $HOME/.zshrc"

echo $UPLOAD_FILE

if [ -d "vimfiles" ]; then
	cp -r $UPLOAD_FILE ./vimfiles
else
	echo "lack of dir(vimfiles)"
	exit 1
fi




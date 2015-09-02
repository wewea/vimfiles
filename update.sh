#!/bin/bash

if [ ! -d "vimfiles" ];then
	mkdir vimfiles
else
	echo "vimfiles dir exist!"
fi

UPLOAD_FILE="$HOME/.vim/dict"
UPLOAD_FILE="$UPLOAD_FILE $HOME/.vim/colors"
UPLOAD_FILE="$UPLOAD_FILE $HOME/.vimrc"
UPLOAD_FILE="$UPLOAD_FILE $HOME/.zshrc"
UPLOAD_FILE="$UPLOAD_FILE $HOME/dircolors-solarized"

echo $UPLOAD_FILE

if [ -d "vimfiles" ]; then
	#cp -r $UPLOAD_FILE ./vimfiles
	rsync -av --exclude="*/.git*" $UPLOAD_FILE ./vimfiles
else
	echo "lack of dir(vimfiles)"
	exit 1
fi

echo "----------------------------------------------------"
echo "Update File:"
git status|awk '/\w*\.[a-z]/{print $NF}'|tr "\n" " " |xargs echo



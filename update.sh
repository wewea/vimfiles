#!/bin/bash

VIMFILES=vimfiles
if [ ! -d "vimfiles" ];then
	mkdir $VIMFILES
else
	echo "vimfiles dir exist!"
fi

SNIPPET="$HOME/.vim/bundle/vim-snippets/snippets"
DICT="$HOME/.vim/dict"
TMUX="$HOME/.tmux.conf"
COLORS="$HOME/.vim/colors"
VIMRC="$HOME/.vimrc"
ZSHRC="$HOME/.zshrc"
DIRCOLOR="$HOME/dircolors-solarized"
JS_INDENT_PLUGIN="$HOME/.vim/bundle/web-indent"
UPLOAD_FILE="$SNIPPET $DICT $TMUX $COLORS $VIMRC $ZSHRC $DIRCOLOR \
						 $JS_INDENT_PLUGIN"

createDir (){
	local path=$1

	local parent_path=${path%/*}
	if [ "$parent_path" != "$VIMFILES" ];then
		createDir "$parent_path"
	fi	
	echo $path

	[ ! -d $path ] && mkdir $path
	return 
}
# test createDir
# createDir vimfiles/a/b/c

for file in $UPLOAD_FILE
do
	if [ -d $file ]; then
		dirPath="${file#${HOME}/}"
		createDir "$VIMFILES/$dirPath"
		rsync -av --exclude="*/.git*" "$file" "./vimfiles/$dirPath"
	else
		# copy common file
		rsync -av --exclude="*/.git*" "$file" "./vimfiles/" 
	fi
done

# echo "----------------------------------------------------"
# echo "Update File:"
# git status|awk '/\w*\.[a-z]/{print $NF}'|tr "\n" " " |xargs echo



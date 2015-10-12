git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ -d "$HOME/.vim" ];then
	mv "$HOME/.vim" "$HOME/.vim-bak"
fi

if [ -f "$HOME/.vimrc" ];then
	mv "$HOME/.vimrc" "$HOME/.vimrc-bak"
fi

if [ -f "HOME/.tmux.conf" ];then


vim +PluginInstall +qall

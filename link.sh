#!/bin/sh

# ln -sf ~/dotfiles/.zshrc ~/.zshrc
# ln -sf ~/dotfiles/.zshrc* ~/
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
# ln -sf ~/dotfiles/colors ~/.vim
# ln -sf ~/dotfiles/powerline ~/.config/powerline

BASE_PATH=$(realpath $(dirname  $0))
ln -sf $BASE_PATH/fishconfig/config.fish ~/.config/fish/config.fish
ln -sf $BASE_PATH/fishconfig/prompt.fish ~/.config/fish/prompt.fish
touch ~/.config/fish/local-path.fish
touch ~/.config/fish/local-aliases.fish


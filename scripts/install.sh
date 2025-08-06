#!/bin/bash

echo "Starting dotfiles scripts/install.sh..."

#echo "Copying gitconfig to ~/.gitconfig..."
#cp ./.gitconfig ~

echo "Installing powerline fonts for zsh agnoster theme..."
# powerline fonts for zsh agnoster theme
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd .. && rm -rf fonts

echo "Installing ohmyzsh and plugins..."

# oh-my-zsh & plugins
# Clean up previous install if it exists
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'

#echo "Copying zshrc to ~/.zshrc..."
#cp ./.zshrc ~

echo "Cleaning up default dotfiles..."
rm ~/.zshrc
rm ~/.zprofile
rm ~/.gitconfig

echo "Linking dotfiles..."
stow .


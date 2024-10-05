# GitHub Copilot Setup for Neovim

## Prerequisites

- Ubuntu 22
- Neovim (latest version)
- Vim (latest version)
- Node.js (version 18 or newer)

## Steps

### Remove Existing Neovim

```sh
sudo apt remove neovim
sudo apt remove vim

#Add Neovim PPA
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt update

#Install Neovim
sudo apt install neovim
sudo apt install vim

#Verify Neovim Installation
nvim --version
vim --version

#Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt update
sudo apt install -y nodejs

#Verify Node.js Installation:
node -v
```

##Edit init.vim file
```sh
#Edit init.vim
nvim ~/.config/nvim/init.vim
```
###Add the following lines:
  - call plug#begin('~/.local/share/nvim/plugged')
  - Plug 'github/copilot.vim'
  - call plug#end()
  
##Install Plugins
Open Neovim and run:
:PlugInstall



##Authenticate GitHub Copilot
  - Open Neovim and run:
  - :Copilot auth


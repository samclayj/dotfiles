# Create a Sudo User

Log in as root, and then create a sudo user. 

Use this user from now on when logging in for development work.

[Digital Ocean Instructions](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart)

# Install Dependencies

## Install Homebrew (for Mac and Linux)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
    
## Install Github CLI

This is worth having - makes managing git repositories much easier after logging in a single time.

**Mac**
```
brew install gh 
```
    
Then login.

**Ubuntu**

Follow instructions for configuring apt-get:

https://github.com/cli/cli/blob/trunk/docs/install_linux.md

Install, then login.

**Login**

    gh auth login

## NeoVim

I just recently started using this, but it's pretty worth it.

- [NeoVim](https://github.com/neovim/neovim)
- [Sample NeoVim Config](https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84)

#### Install NeoVim:

Mac:
```
brew install neovim
```

Linux: https://github.com/neovim/neovim/blob/master/INSTALL.md

#### Install [vim-plug](https://github.com/junegunn/vim-plug):

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### Install Plug-ins:

```
nvim --headless +PlugInstall +qall
```

## Install iTerm
```
brew cask install iterm2
```

## Install tmux

**Mac (with Homebrew)**
```
brew install tmux
```
**Linux**
```
sudo apt-get update
sudo apt-get install tmux
```
## Configure ZSH

**Linux**
```
sudo apt install zsh
```
**Change default shell**
```
sudo chsh -s $(which zsh)
```

### ZSH Plugins

> Install these plugins in `~/.vim/zsh_plugins.` for them to automatically be picked up by
> the config.

**Install Syntax highlighting Plugin**

* [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

**Install ZSH auto suggestions Plugin:**

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.vim/zsh_plugins/zsh-autosuggestions
```

**Install FZF:**
https://github.com/junegunn/fzf#using-git

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Install on New Machine

#### Clone configuration
```
cd ~
git clone http://github.com/samclayj/dotfiles.git ~/.vim
cd ~/.vim
```
#### Create Symbolic Links
```
mkdir -p "~/.config/tmux"
ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
ln -s ~/.vim/zshrc ~/.zshrc
ln -s ~/.vim/tmux.conf ~/.config/tmux/.tmux.conf
```

# Tidying

* I can open vs code in browser (just like cider) by going to github.dev.

Use `tidy` utility to format HTML files:

```
tidy <file>.html
```

Or from Vim:

```
:!tidy
```

To fix indentation in a file, use `=G` in Vim.

### Python

```
pip install git+https://github.com/psf/black
```

Then run

```
black <directory or file>
```

And autoformatting magically happens.

# Iterm Color Schemes

* https://iterm2colorschemes.com/
* Current scheme is Moonfly. Afterglow is another option.
* These themes are already in the Git repo for the configuration, just install in iTerm.
 
## Docking with Ethernet
Set ethernet to default: [macOS - How to get Mac to give Ethernet connection priority? - Ask Different](https://apple.stackexchange.com/questions/245353/how-to-get-mac-to-give-ethernet-connection-priority)

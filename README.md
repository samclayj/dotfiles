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

Linux: TBD

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

**Mac (with Homebrew)**
```
brew install zsh zsh-completions
brew install zsh-syntax-highlighting
```
**Linux**
```
sudo apt install zsh
sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
**Change default shell**
```
sudo chsh -s $(which zsh)
```
**Fix issues about permissions**
```
sudo chmod g-w /usr/local/share/zsh/site-functions
sudo chmod g-w /usr/local/share/zsh

### ZSH Plugins

> Install these plugins in `~/.vim` for them to automatically be picked up by
> the config.

```
**Install Syntax highlighting Plugin**

[ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)


**Install ZSH auto suggestions Plugin:**

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.vim/zsh-autosuggestions
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
ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
ln -s ~/.vim/vim.init ~/.vimrc
ln -s ~/.vim/zshrc ~/.zshrc
ln -s ~/.vim/zshenv ~/.zshenv
ln -s ~/.vim/sam.zsh-theme ~/.oh-my-zsh/themes/sam.zsh-theme
```

Optional - if using Vim instead of NeoVim.
```
ln -s ~/.vim/vimrc ~/.vimrc
```
# Configurations:

tmux configuration file: https://github.com/gpakosz/.tmux

```
git clone https://github.com/gpakosz/.tmux.git
mkdir -p "~/.config/tmux"
ln -s "~/.vim/.tmux.conf" "~/.config/tmux/tmux.conf"
cp "~/.vim/.tmux.conf.local" "~/.config/tmux/tmux.conf.local"
```

# Autoread in Vim

Note there is a custom script on a timer that reloads Vim buffers to have an
advanced autoread capability: https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work

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

https://iterm2colorschemes.com/

Current scheme is Moonfly. Afterglow is another option.

These themes are already in the Git repo for the configuration, just install in iTerm.

# Mac Specific Notes

There's quite a bit of power now in Quick Actions with AppleScript/Automator. You can add these to the touch bar so they are quickly accessible as well.

One example is an Undocking MBP action that I made to eject all attached drives, close Lightroom Classic, and connect to WiFi. There's quite a few options here for additional changes as well.

## Docking with Ethernet
Set ethernet to default: [macOS - How to get Mac to give Ethernet connection priority? - Ask Different](https://apple.stackexchange.com/questions/245353/how-to-get-mac-to-give-ethernet-connection-priority)

# TODO

- [ ] Create a Mac and Linux bash script to automate the installation + configuration.
- [ ] Make some CLIs to automate processes
- [ ] Add Mac specific automation AppleScripts + Automator files


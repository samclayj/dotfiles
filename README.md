# Install Dependencies

## Install Homebrew (for Mac)

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install iTerm

  brew cask install iterm2

## Install tmux

**Mac (with Homebrew)**

  brew install tmux

**Linux**

  sudo apt-get update
  sudo apt-get install tmux

## Install oh my zsh

**Mac (with Homebrew)**

  brew install zsh zsh-completions
  brew install zsh-syntax-highlighting

**Linux**

  sudo apt install zsh
  sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

**Change default shell**

  sudo chsh -s $(which zsh)

**Install oh-my-zsh**

  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

**Fix issues about permissions**

	sudo chmod g-w /usr/local/share/zsh/site-functions
	sudo chmod g-w /usr/local/share/zsh

**Install Syntax highlighting Plugin (Mac)**

  brew install zsh-syntax-highlighting

**Further instructions for Synax Highlighting**

[ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

# Install on New Machine

#### Clone configuration

	cd ~
	git clone http://github.com/samclayj/dotfiles.git ~/.vim
	cd ~/.vim

#### Create Symbolic Links

  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/zshrc ~/.zshrc
  ln -s ~/.vim/.tmux.conf ~/.tmux.conf
  ln -s ~/.vim/sam.zsh-theme ~/.oh-my-zsh/themes/sam.zsh-theme

#### Copy Local tmux file

  cp ~/.vim/.tmux.conf.local ~/.tmux.conf.local

# Configurations:

tmux configuration file: https://github.com/gpakosz/.tmux

# Autoread in Vim

Note there is a custom script on a timer that reloads Vim buffers to have an
advanced autoread capability: https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work

# Iterm Color Schemes

https://iterm2colorschemes.com/

Current scheme is Afterglow.

# Mac Specific Notes

There's quite a bit of power now in Quick Actions with AppleScript/Automator. You can add these to the touch bar so they are quickly accessible as well.

One example is an Undocking MBP action that I made to eject all attached drives, close Lightroom Classic, and connect to WiFi. There's quite a few options here for additional changes as well.

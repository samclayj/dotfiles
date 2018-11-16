# Install Dependencies

## Install Homebrew (for Mac)

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
## Install tmux

**Mac (with Homebrew)**

  brew install tmux

**Linux**

  sudo apt-get update
  sudo apt-get install tmux

## Install oh my zsh

**Mac (with Homebrew)**

    brew install zsh zsh-completions

**Linux**

    sudo apt install zsh
    sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

**Change default shell**

    sudo chsh -s $(which zsh)

# Install on New Machine

#### Clone configuration
    
    cd ~
    git clone http://github.com/samclayj/dotfiles.git ~/.vim
    cd ~/.vim
    
#### Create Symbolic Links

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/zshrc ~/.zshrc
    ln -s ~/.vim/.tmux.conf ~/.tmux.conf

#### Copy Local tmux file

    cp ~/.vim/.tmux.conf.local ~/.tmux.conf.local

# Configurations:

tmux configuration file: https://github.com/gpakosz/.tmux

# Create Symbolic Links

	ln -s ~/.vim/.vimrc ~/.vimrc

# Add a new plugin
    
    cd ~/.vim
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

# Install on New Machine

    cd ~
    git clone http://github.com/samclayj/dotfiles.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/tmux.conf ~/.tmux.conf
    cd ~/.vim
    git submodule update --init
    
# Install tmux

    sudo apt-get update
    sudo apt-get install tmux

# Update plugins

    git submodule foreach git pull origin master

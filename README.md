# Install on New Machine

### Pre-Req

Install the major dependencies in the "Install Dependencies" section.

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
ln -s ~/.vim/tmux.conf ~/.tmux.conf
```

# Useful Commands with this Installation

Fuzzy file search and open in Vim:
```
v $(fzf)
```
then tab for expansion.

`ALT-c` for fuzzy directory search.

Regex searches in files:

```
rg <regex>
rg <regex> --files | fzf
```

Also in general it's pretty useful to pipe anything into fzf.

```
ls -a | fzf
```

# Create a Sudo User

> Note: if I make this user `sam` things will be easier because the path
> variables are picked up automatically.

Log in as root, and then create a sudo user. 

Use this user from now on when logging in for development work.

[Digital Ocean Instructions](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart)

# Installing Tailscale

This is a VPN that allows all devices to appear on the same local network
regardless of location. It's really amazing and easy to setup

Ubuntu:

* https://tailscale.com/download/linux/ubuntu-2404

```
curl -fsSL https://tailscale.com/install.sh | sh sudo tailscale up
```

On Mac/iOS just download the tailscale app and login.

Settings can be managed in the Tailscale app, but this allows SSH and access by
local name rather than IP.... automatically. 

It also allows mounting external storage.

For Digital Ocean, you might need to adjust the droplet firewall settings
to allow Tailscale's IP.

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

Note: I found recently that I can just use the Terminal theme rather than
installing a neovim theme at all. This is quite a bit simpler. Now just install
iTerm or Ghosty, configure a theme, and Neovim picks up all of the theme syntax
highlighting automatically.

Mac:
```
brew install neovim
```

Linux: https://github.com/neovim/neovim/blob/master/INSTALL.md

```
sudo apt remove neovim
sudo apt install neovim
```

#### Install [vim-plug](https://github.com/junegunn/vim-plug):

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### Install Plug-ins:

```
nvim --headless +PlugInstall +qall
```

## Install Terminal

**Mac**

Install Ghostty, and set a theme. It supports light/dark and is quite a bit
simpler to use.

**Remote Host**

[Add Ghostty’s terminfo to a remote machine](https://ghostty.org/docs/help/terminfo):

```
infocmp -x | ssh YOUR_SERVER -- tic -x -
```
Then SSH like normal.

* https://ghostty.org

```
theme = GruvboxDark
```

**iPad**

Install Secure Shellfish.

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

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.vim/zsh_plugins/zsh-syntax-highlighting
```

**Install ZSH auto suggestions Plugin:**

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.vim/zsh_plugins/zsh-autosuggestions
```

**Install ZSH Completions:**

https://github.com/zsh-users/zsh-completions?tab=readme-ov-file#manual-installation

```
git clone https://github.com/zsh-users/zsh-completions.git ~/.vim/zsh_plugins/zsh-completions

```

**Install FZF:**

Note that the zshrc should automatically detect if you are on a mac and use
the correct fzf source approach.

Mac:

https://github.com/junegunn/fzf#using-git

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Ubuntu:
```
sudo apt-get install fzf
```

**Install Rip Grep:**

https://github.com/BurntSushi/ripgrep


**Install Rip Grep ALl (RGA):**

Rip grep for other file types.

https://github.com/phiresky/ripgrep-all


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

## Docking with Ethernet
Set ethernet to default: [macOS - How to get Mac to give Ethernet connection priority? - Ask Different](https://apple.stackexchange.com/questions/245353/how-to-get-mac-to-give-ethernet-connection-priority)

# Python Development

## Install Jupyter (for Rapid Prototyping)

Voila for dashboarding.

```
# Install
pip install jupyterlab
brew install jupyterlab

# Launch
jupyter lab
```

## Install Django on Ubuntu

```
sudo apt update
sudo apt-get install python3-full
sudo apt install python3-pip
python3 -m venv personalprojects
source personalprojects/bin/activate
python -m pip install --upgrade pip --break-system-packages
python3 -m pip install Django
echo 'export PATH="/home/sam/.local/bin:$PATH"' >> ~/.zshrc
```

Open Port 8000:

```
sudo ufw allow 8000
```

Add an inbound traffic rule for TCP at port 8000:
* https://cloud.digitalocean.com/networking/firewalls/f4b28212–57db-4fee-a87b-8ac6fef6b918/rules?i=518805

This can be scoped to port 8000.

Then I can log in!

http://204.48.19.140:8000/focus/

# Dotfiles & System Setup

This repository contains configuration files (dotfiles) and setup instructions for macOS and Linux development environments.

---

## Installation on a New Machine

### 1. Prerequisites
Install the major dependencies listed in the [Dependencies](#dependencies) section first.

### 2. Clone Configuration
```bash
cd ~
git clone http://github.com/samclayj/dotfiles.git ~/.vim
cd ~/.vim
```

### 3. Create Symbolic Links
```bash
mkdir -p ~/.config/tmux
mkdir -p ~/.config/nvim

ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
ln -s ~/.vim/zshrc ~/.zshrc
ln -s ~/.vim/tmux.conf ~/.tmux.conf
```

### 4. Create a Sudo User
> **Note:** If you name this user `sam`, setup will be easier because path variables are picked up automatically.

Log in as `root`, and then create a sudo user. Use this user from now on when logging in for development work. See the [Digital Ocean Instructions](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart) for reference.

---

## Dependencies

### Tailscale
Tailscale is a VPN that allows all devices to appear on the same local network regardless of location. It also allows mounting external storage.

* **Mac/iOS:** Download the Tailscale app and log in.
* **Ubuntu:** Follow the [Tailscale Linux Install Guide](https://tailscale.com/download/linux/ubuntu-2404).
  ```bash
  curl -fsSL https://tailscale.com/install.sh | sh
  sudo tailscale up
  ```

*For Digital Ocean droplets, adjust the firewall settings to allow Tailscale's IP if needed.*

### Homebrew (Mac and Linux)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Jujutsu (jj)
Jujutsu is a Git-compatible version control system.

#### Installation (Mac)
```bash
brew install jj
brew install watch
```

#### Configuration
```bash
jj config set --user user.name "Sam Jentsch"
jj config set --user user.email "samclayj@gmail.com"
```

*Use `jjwatch` (or `watch -c "jj log --no-pager --color=always"`) for a live view of pending commits.*

### GitHub CLI
Helps manage repositories easily from the command line.

#### Installation (Mac)
```bash
brew install gh
```

#### Installation (Ubuntu)
Follow instructions for configuring `apt-get` at [GitHub CLI Linux Install Docs](https://github.com/cli/cli/blob/trunk/docs/install_linux.md), then install.

#### Authentication
```bash
gh auth login
```

### NeoVim
An extensible Vim-based text editor.

* **iTerm/Ghostty Tip:** Using the terminal theme directly is much simpler than installing a separate NeoVim theme. Neovim automatically inherits syntax highlighting styles from the terminal emulator.

#### Installation
* **Mac:**
  ```bash
  brew install neovim
  ```
* **Linux:** (See the [NeoVim Linux Install Guide](https://github.com/neovim/neovim/blob/master/INSTALL.md))
  ```bash
  sudo apt remove neovim
  sudo apt install neovim
  ```

#### Plugin Manager (vim-plug)
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### Install Plugins
```bash
nvim --headless +PlugInstall +qall
```

### Terminal Emulators

#### Mac
Install [Ghostty](https://ghostty.org) and set a theme (e.g., `theme = GruvboxDark`). It supports light/dark switching and is simple to use.

#### Remote Host
[Add Ghostty's terminfo to a remote machine](https://ghostty.org/docs/help/terminfo):
```bash
infocmp -x | ssh YOUR_SERVER -- tic -x -
```
Then SSH as normal.

#### iPad
Install **Secure Shellfish** for SSH and terminal access.

### Tmux
Terminal multiplexer for managing multiple terminal sessions.

* **Mac:**
  ```bash
  brew install tmux
  ```
* **Linux:**
  ```bash
  sudo apt-get update
  sudo apt-get install tmux
  ```

### ZSH Configuration

#### Linux Installation
```bash
sudo apt install zsh
```

#### Set ZSH as Default Shell
```bash
sudo chsh -s $(which zsh)
```

#### Plugins
> Install these plugins under `~/.vim/zsh_plugins/` so they are automatically loaded by the shell configuration.

* **ZSH Syntax Highlighting:**
  ```bash
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.vim/zsh_plugins/zsh-syntax-highlighting
  ```
* **ZSH Auto-Suggestions:**
  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.vim/zsh_plugins/zsh-autosuggestions
  ```
* **ZSH Completions:**
  ```bash
  git clone https://github.com/zsh-users/zsh-completions.git ~/.vim/zsh_plugins/zsh-completions
  ```
* **FZF (Fuzzy Finder):**
  * **Mac:**
    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    ```
  * **Ubuntu:**
    ```bash
    sudo apt-get install fzf
    ```
* **Ripgrep:** See [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep).
* **Ripgrep-All (RGA):** Ripgrep for PDF, Ebooks, Word docs, etc. See [phiresky/ripgrep-all](https://github.com/phiresky/ripgrep-all).

---

## macOS-Specific Setup

### Ethernet Priority
To ensure macOS prioritizes physical Ethernet over Wi-Fi when docked, follow [this Apple StackExchange guide](https://apple.stackexchange.com/questions/245353/how-to-get-mac-to-give-ethernet-connection-priority).

### BetterTouchTool
For mouse, trackpad, and keyboard shortcuts. The `Default.bttpreset` file in this repository contains the latest configuration preset.

### Date Format
Set the date format on your Mac to `YYYY-MM-DD` in **System Settings**.

### Caps Lock to Control
Remap **Caps Lock** to the **Control (Ctrl)** key in **System Settings**.

---
## Python Development

Astral **`uv`** is used to manage Python versions, virtual environments, and dependencies.

### Installation
* **Mac:**
  ```bash
  brew install uv
  ```
* **Linux/Ubuntu:**
  ```bash
  curl -LsSf https://astral.sh/uv/install.sh | sh
  ```

### JupyterLab
Used for rapid prototyping.
```bash
# Launch JupyterLab instantly in an ephemeral environment
uv run --with jupyterlab jupyter lab

# Or install it globally as a standalone tool
uv tool install jupyterlab
jupyter lab
```

### Django (Ubuntu)
```bash
sudo apt update
# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Create a virtual environment using uv
uv venv personalprojects
source personalprojects/bin/activate

# Install Django
uv pip install django
```

#### Open Firewall Port 8000
```bash
sudo ufw allow 8000
```
Add an inbound TCP firewall rule for port 8000 in your [Digital Ocean console](https://cloud.digitalocean.com/networking/firewalls), then log in at `http://<your-ip>:8000/focus/`.

---

## Useful Commands

### Searching
* **Fuzzy search files and open in Vim:**
  ```bash
  v $(fzf) # Press Tab for expansion
  ```
* **Fuzzy search directories:** Press `ALT-c`.
* **Regex search in files:**
  ```bash
  rg <regex>
  rg <regex> --files | fzf
  ```
* **Piping to FZF:**
  ```bash
  ls -a | fzf
  ```

### Formatting & Tidying
* **VS Code in Browser:** Open GitHub files in a web browser editor by navigating to `github.dev` (or pressing `.` on any repository page).
* **HTML Autoformatting:** Use `tidy` to format HTML files.
  ```bash
  tidy <file>.html
  ```
  Or from within Vim:
  ```vim
  :!tidy
  ```
  *(To fix indentation of the current file in Vim, press `=G`.)*
* **Python Autoformatting:** Use `black` to format Python code.
  ```bash
  uvx black <directory-or-file>
  ```

---

## Agent Customization

Instructions for agentic AI coding assistants (like Google Antigravity).

### Symlink Skills Globally
Custom workspace skills can be shared globally across all your repositories:
```bash
# Create the global skills directory if it doesn't exist
mkdir -p ~/.gemini/antigravity-cli/skills

# Symlink the project-change-management skill
ln -s ~/.vim/.agent/skills/project-change-management ~/.gemini/antigravity-cli/skills/project-change-management
```

### Symlink Global Persona (AGENTS.md)
To share your personal interaction guidelines and rules globally:
```bash
# Symlink global persona rules
ln -sf ~/.vim/AGENTS.md ~/.gemini/AGENTS.md
```

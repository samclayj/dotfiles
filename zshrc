export EDITOR="nvim"
export VISUAL="nvim"

autoload -U compinit; compinit
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file

alias v='nvim'
bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# Press V to edit command in vim.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

PS1='%F{blue}%~ 🦑%(?.%F{green}.%F{red}) '

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# Vim mode support
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# plugins
fpath=(/Users/samueljentsch/.vim/zsh-completions/ $fpath)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/samueljentsch/.vim/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

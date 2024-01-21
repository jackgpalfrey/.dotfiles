# Path to oh-my-zsh installation
# export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:~/scripts

export LANG=en_UK.UTF-8

# Name of theme to load 
# Set to 'random' to load a random theme each time, 
# you can see which plugin you have with echo $RANDOOM_THEME

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

HIST_STAMPS="dd/mm/yyyy"

# plugins=(git zsh-autosuggestions)

# keybinds
bindkey -s ^f "sesh\n"

# aliases
alias ls="ls --color=auto"

alias vim="nvim"
alias vi="nvim"

eval "$(starship init zsh)"

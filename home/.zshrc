# Path to oh-my-zsh installation
# export ZSH="$HOME/.oh-my-zsh"

export PATH=$PATH:~/scripts

export LANG=en_UK.UTF-8

# Name of theme to load 
# Set to 'random' to load a random theme each time, 
# you can see which plugin you have with echo $RANDOOM_THEME
ZSH_THEME="robbyrussell"

HIST_STAMPS="dd/mm/yyyy"

# plugins=(git zsh-autosuggestions)

# keybinds
bindkey -s ^f "sesh\n"

# aliases
alias ls="ls --color=auto"

eval "$(starship init zsh)"

# Alias.
alias md=mkdir
alias v=nvim
alias vinit='v ~/.config/nvim/init.vim'
alias tinit='v ~/.tmux.conf'
alias st='tmux source ~/.tmux.conf'
alias finit='v ~/.config/fish/config.fish'
alias lla='ls -a -l'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gcm='git commit -m'

# Remove default Fish greeting.
set fish_greeting

fish_add_path $HOME/.cargo/bin

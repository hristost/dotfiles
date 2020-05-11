fish_vi_key_bindings
	
set -g theme_powerline_fonts no
set -g theme_color_scheme zenburn

# rbenv
status --is-interactive; and source (rbenv init -|psub)
set -gx GEM_HOME ~/.gems

# iTerm integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# PIP
set -gx PATH {$HOME}/Library/Python/3.7/bin $PATH

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
set -g fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths

thefuck --alias | source

# Run tmux with the config file in ~/.config/tmux/
alias tmux "tmux -f ~/.config/tmux/tmux.conf"

# Config is an alias for managing dotfiles w/ git. 
# See https://www.atlassian.com/git/tutorials/dotfiles
alias config "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

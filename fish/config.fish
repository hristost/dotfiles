fish_vi_key_bindings
	
set -g theme_color_scheme terminal

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

# Config is an alias for managing dotfiles w/ git. 
# See https://www.atlassian.com/git/tutorials/dotfiles
alias config "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"


set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

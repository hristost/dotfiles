fish_vi_key_bindings
	
# bobthefish prompt configuration
#set -g theme_color_scheme terminal-light
set -g theme_date_timezone America/New_York


# kakoune integation
set -gx PATH {$HOME}/.config/kak/plugins/connect.kak/bin/ $PATH
# add clangd to path
set -gx PATH /usr/local/Cellar/llvm/11.0.0/bin/ $PATH

# iTerm integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# PIP
set -gx PATH {$HOME}/Library/Python/3.7/bin $PATH
set -gx PATH {$HOME}/.cargo/bin $PATH
set -gx PATH {$HOME}/.cabal/bin $PATH
set -gx PATH {$HOME}/.ghcup/bin $PATH

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# man
set -Ux LESS "-RF"
set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -g fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths

thefuck --alias | source

# Set the prompt to use ANSI colours
# See https://github.com/fish-shell/fish-shell/issues/3443#issuecomment-511227428
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

complete -f -c dpll -s g -l graph   -d "Show an inline implication graph"
complete -f -c dpll -s n -l nolearn -d "Don't learn new clauses"
complete -f -c dpll -s p -l pure    -d "Don't eliminate pure literals"
complete -f -c dpll -s v -l verbose -d "Verbose output. Specify twice for extra detail"
complete -f -c dpll -s h -l help    -d "Show help"
complete -f -c dpll -s V -l version -d "Print program version"
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /Users/hs/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /Users/hs/.ghcup/bin $PATH

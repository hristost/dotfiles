# sk
# https://github.com/lotabout/skim

# Dependencies:
# – fd (https://github.com/sharkdp/fd)
# – bat (https://github.com/sharkdp/bat)
# – ripgrep (https://github.com/BurntSushi/ripgrep)

provide-module connect-sk %{
  # Modules
  require-module connect

  # Register our paths
  set-option -add global connect_paths "%val{config}/connect-sk/aliases" "%val{config}/connect-sk/commands"

  # Commands
  # Files
  define-command sk-files -params .. -file-completion -docstring 'Open files with sk' %{
    + :sk-files %arg{@}
  }

  # Buffers
  define-command sk-buffers -params ..1 -buffer-completion -docstring 'Open buffers with sk' %{
    + :sk-buffers %arg{@}
  }

  # Grep
  define-command sk-grep -params .. -file-completion -docstring 'Open files (search by content) with sk' %{
    + :sk-grep %arg{@}
  }

  # Aliases
  alias global sk sk-files
}

# Dart
set --global --export PUB_CACHE $HOME/.pub_cache

# Go
set --global --export GOPATH $HOME/go
fish_add_path --global $GOPATH/bin

# Homebrew
set --global --export HOMEBREW_PREFIX /opt/homebrew
set --global --export HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
set --global --export HOMEBREW_REPOSITORY $HOMEBREW_PREFIX
set --global --export MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
set --global --export INFOPATH $HOMEBREW_PREFIX/share/info $INFOPATH
fish_add_path --global $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin

# Homebrew/command-not-found
set --local homebrew_command_not_found_handler $HOMEBREW_REPOSITORY/Library/Taps/homebrew/homebrew-command-not-found/handler.fish
if test -f $homebrew_command_not_found_handler
  source $homebrew_command_not_found_handler
end

# pnpm
set --global --export PNPM_HOME $HOME/Library/pnpm
fish_add_path --global $PNPM_HOME

# Rust
fish_add_path --global $HOME/.cargo/bin

# Starship
starship init fish | source

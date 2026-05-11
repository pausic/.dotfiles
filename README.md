# .dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Description |
|---------|-------------|
| aerospace | Tiling window manager |
| brew-bundle | Homebrew dependencies |
| git | Git config, signing keys, global ignore |
| k9s | Kubernetes TUI |
| neovim | Editor config (btw) |
| sketchybar | macOS status bar |
| starship | Shell prompt |
| tmux | Terminal multiplexer |
| zsh | Shell config (oh-my-zsh, fzf-tab, zoxide) |

## Usage

Requires [GNU Stow](https://www.gnu.org/software/stow/).

Symlink all packages:
```sh
stow aerospace brew-bundle git k9s neovim sketchybar starship tmux zsh
```

Install Homebrew dependencies:
```sh
brew bundle --file=brew-bundle/Brewfile
```

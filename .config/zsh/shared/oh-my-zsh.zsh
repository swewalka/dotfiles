export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ys"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
  sudo
  git
  docker
  python
  bundler
  dotenv
  rake
  rbenv
  ruby
  zsh-autosuggestions
  zsh-history-substring-search
  you-should-use
  zsh-syntax-highlighting
  starship
  archlinux
  aliases
)
source "$ZSH/oh-my-zsh.sh"

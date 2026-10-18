# Shared entrypoint; yadm selects ~/.config/zsh/machine.zsh.
if [[ -r "$HOME/.config/zsh/machine.zsh" ]]; then
  source "$HOME/.config/zsh/machine.zsh"
else
  source "$HOME/.config/zsh/machine.zsh##default"
fi

source "$HOME/.config/zsh/shared/environment.zsh"
source "$HOME/.config/zsh/shared/oh-my-zsh.zsh"
source "$HOME/.config/zsh/shared/editor.zsh"
source "$HOME/.config/zsh/shared/aliases.zsh"
source "$HOME/.config/zsh/shared/tools.zsh"

# Preserve the original post-alias initialization order.
if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

[[ -r "$HOME/.dart-cli-completion/zsh-config.zsh" ]] &&
  source "$HOME/.dart-cli-completion/zsh-config.zsh" || true

# Preserve the local Miniforge setup and its hook/profile/PATH fallback order.
if [[ -x "$HOME/.miniforge3/bin/conda" ]] &&
    __conda_setup="$("$HOME/.miniforge3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"; then
  eval "$__conda_setup"
elif [[ -r "$HOME/.miniforge3/etc/profile.d/conda.sh" ]]; then
  source "$HOME/.miniforge3/etc/profile.d/conda.sh"
elif [[ -d "$HOME/.miniforge3/bin" ]]; then
  export PATH="$HOME/.miniforge3/bin:$PATH"
fi
unset __conda_setup

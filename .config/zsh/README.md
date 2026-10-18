# Zsh configuration

`~/.zshrc` is the entrypoint. It loads the yadm-selected `machine.zsh`, then
the shared modules in the original order:

1. `shared/environment.zsh`: PATH and Chromium environment settings.
2. `shared/oh-my-zsh.zsh`: Oh My Zsh, theme, options, and ordered plugins.
3. `shared/editor.zsh`: editor environment overrides, kept after Oh My Zsh.
4. `shared/aliases.zsh`: personal aliases, overriding plugin aliases.
5. `shared/tools.zsh`: Starship, Dart completions, then Miniforge/Conda.

Edit these shared files for settings used on every machine. The Starship plugin
and explicit initialization are both retained from the original configuration.
Dart completion and Conda initialization are skipped when unavailable; Conda
keeps its hook, profile script, then existing bin directory fallback order.

`machine.zsh##default` currently serves all hosts. Add `machine.zsh##h.Ahch-To`
or `machine.zsh##h.Toydaria` only for actual machine differences; do not copy
shared settings into host files. Machine settings run before the shared modules.

Track the entrypoint, shared files, README, `.gitignore`, and `##` variants.
`machine.zsh` is a generated symlink; edit its variant instead. Run `yadm alt`
after staging a new variant or switching machines (automatic alternates are
disabled here). Without a generated link, the entrypoint loads the default.
Shared edits need no regeneration. Backups are in `backups/`; symlinks and
backups are ignored.

Validate each source with `zsh -n <file>`, then check startup with `zsh -ic exit`.

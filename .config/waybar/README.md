# Waybar configuration

## Shared settings

- `shared/modules.jsonc`: common bar settings and module definitions.
- `shared/style.css`: common appearance for both machines.
- `style.css`: imports the shared stylesheet and selected machine overrides.

## Machine differences

- `config##default`: Ahch-To/laptop layout, with battery and
  `hyprland/workspaces`, including the existing persistent workspace settings.
- `config##h.Toydaria`: desktop layout, with `ext/workspaces` and a power button.
- `machine.css##default`: shared appearance without additional overrides.
- `machine.css##h.Toydaria`: desktop clock/audio border adjustments.

Ahch-To inherits the default files; it no longer needs identical copies.

`config` and `machine.css` are generated yadm symlinks. Edit their `##` source
files, then run `yadm alt` to select the appropriate files. This installation
has automatic alternate processing disabled. Shared edits need no regeneration.

Waybar finds the included `shared/modules.jsonc` through its configuration
search path. Values defined in the machine config take precedence over includes.
CSS imports are relative to `style.css`; machine rules load after shared rules.

All pre-existing modules, commands, styles, and the scripts directory are
preserved. The old `config.bak` remains untouched. Backups are under `backups/`;
generated symlinks and backups are ignored by yadm. Restart/reload Waybar after
editing configuration or styles to apply the changes.

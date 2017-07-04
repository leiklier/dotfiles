# Vim-settings

## Intended usage

The intended usage of this directory is to store settings related to the text editor vim.

## Subdirectories

The settings are sorted in the three subdirectories as listed below. The files are given their extensions
based on their origin:

__REPO__: Files ending in `*.vim` are tracked by git, and could be deleted when issuing `git pull origin`.

__LOCAL__: Files ending in `*.local.vim` are ignored by git, and local settings may therefore be written
in files following this naming convention.

### Plugins

__PATH:__ `settings/plugins`

Each plugin's overrides/settings should be put in a separate file named `{plugin-name}.vim` in this
directory.

### Keymaps

__PATH:__ `settings/plugins`

Keymaps is found in this directory. Keymaps specific for __Linux__ should be written
to the file `keymap-linux.vim`. Keymaps specific for __macOS__ should be written to the file `keymap-mac.vim`
All other keymaps should be written to the file `keymap-all.vim`.

### Miscellaneous

__PATH:__ `settings/misc`

General vim overrides/settings should be put in a separate file named `{descriptive-name}.vim` in this
directory.

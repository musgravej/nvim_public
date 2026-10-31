# Neovim Configuration Changelog

## [2026-10-30] - Updates for Neovim 0.13 Compatibility

### Neovim 0.13 Multicursor
* Added native multicursor configuration in multicursor.lua, loaded from init.lua.
* Mapped <C-d> and <C-S-d> to add cursors at the next and previous word matches.
* Added [c and ]c mappings to navigate between cursors.
* Set the secondary cursor color to orange (#FFA01C).
* Mapped <C-p> to clear native cursors and search highlights.

### Keymaps and Plugins
* Moved centered scrolling from <C-d> and <C-S-d> to <C-u> and <C-S-u> in keymaps.lua.
* Changed nvim-recorder controls from q/Q and <leader>q… to t/T and <leader>t….
* Removed <C-n> and <C-p> from Blink’s completion keymap; arrow keys remain available for navigation.

### Documentation
* Updated setup notes in README.md.
* Added a Neovim 0.13 changelog heading in CHANGELOG.md.


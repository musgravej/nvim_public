# Neovim Config
## Neovim 0.11

# Deprecated Version
* This version of config files will not be updated, due to changes in packages compatability with neovim 0.11 and 0.12
* install neovim 0.12 and checkout `neovim-12-blink` for an updated config file

### Use at your own risk!
* This config may not work on all systems, and should not be considered to be completely up to date for all settings.
* Notes here are as accurate as I could remember them.
* If something doesn't work, you may be responsible for troubleshooting your own solutions.

## Suggested Config Installation:
* [Install](https://github.com/neovim/neovim/blob/master/INSTALL.md) [Neovim](https://neovim.io)
* Clone this repository to a `custom_path` (if not installing directly into nvim config directory)
* If applicable, rename current neovim custom config path to non-matching name (ex: `~/.config/nvim` -> `~/.config/_nvim`)
* Create symbolic link from repository to nvim config path (ex: `ln -s custom_path/nvim_public ~/.config/nvim`)
* Launch neovim, allow packages to install
    - review installation logs for missing / required packages (some packages may require locally installed terminal programs).
    - best run from "advanced" terminal, like [iTerm](https://iterm2.com), with compatible fonts.
        - [nerd fonts](https://www.nerdfonts.com)
    - dependent system package requirements
        - [fd](https://github.com/sharkdp/fd)
        - [ripgrep](https://github.com/BurntSushi/ripgrep)
        - [lazygit](https://github.com/jesseduffield/lazygit)
        - *Possibly* [fzf](https://github.com/junegunn/fzf)
            - install directly from git, not with package manager

### Install Neovim from [source](https://github.com/neovim/neovim?tab=readme-ov-file#install-from-source)
* `make CMAKE_BUILD_TYPE=RelWithDebInfo`
* `sudo make install`

### Install over previous Neovim config
* For best results, allow Lazy and Mason to reinstall all plugins and LSPs.
* Delete files in `~/.local/share/nvim/lazy/` and `~/.local/share/nvim/mason/`
* Open Neovim, allow Lazy to install packages, close and reopen, allow Mason to install packages.
* See notes in lua/nvimuser/plugins/mason.lua for instructions on installing formatters and linters.
* Check installation with command `:checkhealth`

### LSP
* LSP is provided here with a few examples, compatible with the Neovim 0.11.
* Sample files have been provided in /scratch.
* LSP servers can be evaluated with `:LspInfo`
* Manually start LSP on file with `:LspStart`

### Completion
* This branch uses [Blink](https://cmp.saghen.dev) as an alternative to `nvim-cmp`.
* See documentation for configuration and plugin lua file for keymaps.

### Raspberry Pi (ARM64)
* `git clone https://github.com/neovim/neovim.git`
* `make CMAKE_BUILD_TYPE=RelWithDebInfo`
* `cd build`
* `cpack -G DEB`
* `sudo dpkg -i ^package^` ex: "nvim-linux64.deb"

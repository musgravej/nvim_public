# Neovim (0.12) Config

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
        - [npm](https://nodejs.org/en/download/)
            - [yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)
        - [fd](https://github.com/sharkdp/fd)
        - [ripgrep](https://github.com/BurntSushi/ripgrep)
        - [lazygit](https://github.com/jesseduffield/lazygit)
        - *Possibly* [fzf](https://github.com/junegunn/fzf)
            - install directly from git, not with package manager

### Install Neovim from [source](https://github.com/neovim/neovim?tab=readme-ov-file#install-from-source)
* Default build
    - `make CMAKE_BUILD_TYPE=RelWithDebInfo`
    - `sudo make install`

* To install to a non-default location
    - `make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/full/path/`
    - `make install`

## Changes from Neovim 0.11
Neovim 0.12 has significant changes.\
Like the upgrade from `0.10` -> `0.11`, the change to `0.12` is significant and breaking.\
For best experience, you should uninstall packages and linters.\
There are significant changes for package management and the treesitter plugin.
* `treesitter-cli` is required for treesitter to work
* Install any way that will put treesitter in __your__ system path
* Ex install: `npm install -g tree-sitter-cli`, or install from homebrew (MacOS).
* You can check that `treesitter-cli` is installed with `which treesitter`
* Reinstall treesitter parsers, delete files from `.local/share/nvim/site/parser`
* Reinstall Neovim packages and linters by deleting files `$HOME/.local/state/nvim/lazy` and `$HOME/.local/state/nvim/mason`
* See `plugins/treesitter.lua` for notes in installing parsers manually.  A new installation may not install parsers automatically.

After upgrade run `checkhealth nvim-treesitter`

# GLIBC Error
* uninstall tree-sitter: `npm uninstall -g tree-sitter-cli`
* install compatable version: `npm install -g tree-sitter-cli@0.24.7`

## Upgrade resources
* https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
* https://tduyng.com/blog/neovim-basic-setup/#why-neovim-012-nightly
* https://dotfiles.substack.com/p/whats-new-in-neovim-012

### Install over earlier versions of Neovim
* For best results, allow Lazy and Mason to reinstall all plugins and LSPs.
* Delete files in `~/.local/share/nvim/lazy/` and `~/.local/share/nvim/mason/`
* Open Neovim, allow Lazy to install packages, close and reopen, allow Mason to install packages.
* See notes in lua/nvimuser/plugins/mason.lua for instructions on installing formatters and linters.
* Check installation with command `:checkhealth`

### LSP
* LSP is provided here with a few examples, compatible with the Neovim 0.12.
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

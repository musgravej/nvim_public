# Neovim Config

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

## Install Neovim from [source](https://github.com/neovim/neovim?tab=readme-ov-file#install-from-source)
* `make CMAKE_BUILD_TYPE=RelWithDebInfo`
* `sudo make install`

### Raspberry Pi (ARM64)
* `git clone https://github.com/neovim/neovim.git`
* `make CMAKE_BUILD_TYPE=RelWithDebInfo`
* `cd build`
* `cpack -G DEB`
* `sudo dpkg -i {package, ex: nvim-linux64.deb}`

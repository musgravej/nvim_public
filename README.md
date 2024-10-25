[Neovim](https://neovim.io)

Neovim installation [instructions](https://github.com/neovim/neovim/blob/master/INSTALL.md)

Suggested installation:
* Install Neovim
* Clone this repository to a `custom_path` (if not installing directly into nvim config directory)
* Rename Neovim custom config file path to non-matching name (ex: `~/.config/nvim` -> `~/.config/_nvim`)
* Create symbolic link from repository to nvim config path (ex: `ln -s custom_path/nvim_public ~/.config/nvim`)
* Launch neovim, allow packages to install
    - review installation logs for missing / required packages (some packages may require locally installed terminal programs).
    - best run from "advanced" terminal, like [iTerm](https://iterm2.com), with compatible fonts.
    - dependent system package requirements
        - [fd](https://github.com/sharkdp/fd)
        - [ripgrep](https://github.com/BurntSushi/ripgrep)
        - *Possibly* [fzf](https://github.com/junegunn/fzf)
            - install directly from git, not with package manager

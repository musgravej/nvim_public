# NEOVIM
* softlink this file to downloaded neovim repo for installation instructions

## Managing Neovim versions
* each directory is for a neovim version
* build from source
```
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

```
make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install
```

* in `~/.local/bin/` make a soft link to the version

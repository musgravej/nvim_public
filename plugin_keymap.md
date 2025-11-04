# Neovim Plugin Keybindings

This document contains all custom keybindings organized by plugin in my Neovim configuration.

## Table of Contents
- [Telescope](#telescope)
- [Harpoon](#harpoon)
- [LSP Configuration](#lsp-configuration)
- [Git Signs](#gitsigns)
- [File Navigation](#filenav)
- [Aerial (Code Symbols)](#aerial)
- [Neo-tree (File Explorer)](#neo-tree)
- [Persisted (Sessions)](#persisted)
- [Substitute](#substitute)
- [Copilot](#copilot)
- [Copilot Chat](#copilot-chat)
- [Vim Maximizer](#vim-maximizer)
- [Telescope Diff](#telescope-diff)
- [Git Portal](#gitportal)
- [Noice](#noice)
- [Blink (Completion)](#blink-completion)
- [CSV View](#csv-view)
- [Custom Grep Search](#custom-grep-search)
- [Toggle Terminal](#toggleterm)
- [Trouble](#trouble)
- [Snacks](#snacks)
- [Winshift](#winshift)
- [Todo Comments](#todo-comments)
- [Nvim Window](#nvim-window)
- [Stewart Multicursor](#stewart-multicursor)

---

## Telescope

**Description:** Fuzzy finder and search plugin

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `z=` | Spell suggestions |
| `n` | `<leader>ch` | Show command history |
| `n` | `<leader>fb` | Show buffers |
| `n` | `<leader>fd` | Find string under cursor in current directory |
| `n` | `<leader>ff` | Fuzzy find files in cwd |
| `n` | `<leader>gS` | Git files status |
| `n` | `<leader>fg` | Find string (grep) in cwd |
| `n` | `<leader>fm` | Fuzzy find marks |
| `n` | `<leader>fo` | Fuzzy find recent files |
| `n` | `<leader>fR` | Find registers |
| `n` | `<leader>fS` | Find all document symbols |
| `n` | `<leader>fT` | Find todos (FzfLua) |
| `n` | `<leader>ft` | Find todos (Telescope) |
| `n` | `<leader>fh` | Find fuzzy here (in this buffer) |
| `n` | `<leader>rn` | Smart rename |
| `n` | `<leader>fr` | Find references |
| `n` | `<leader>rp` | Paste from register prompt |

---

## Harpoon

**Description:** Quick file navigation and bookmarking

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<C-e>` | Open harpoon window |
| `n` | `<leader>ha` | Harpoon add file |
| `n` | `<leader>hx` | Harpoon remove file |
| `n` | `<leader>hm` | Harpoon quick menu |
| `n` | `<leader>h1` | Harpoon to file 1 |
| `n` | `<leader>h2` | Harpoon to file 2 |
| `n` | `<leader>h3` | Harpoon to file 3 |
| `n` | `<leader>h4` | Harpoon to file 4 |
| `n` | `<leader>h5` | Harpoon to file 5 |
| `n` | `<leader>k` | Harpoon next in harpoon list |
| `n` | `<leader>j` | Harpoon previous in harpoon list |

**Harpoon Menu Buffer Only:**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<C-v>` | Open file in v-split |
| `n` | `<C-x>` | Open file in h-split |
| `n` | `<C-t>` | Open file in new tab |

---

## LSP Configuration

**Description:** Language Server Protocol keybindings

| Mode | Keymap | Description |
|------|--------|-------------|
| `i` | `<C-S-O>` | Trigger code completion (omni) |
| `n` | `gD` | Go to declaration |
| `n` | `gd` | Go to definitions |
| `n` | `<leader>fr` | Show LSP references |
| `n,v` | `<leader>la` | See available LSP code actions |
| `n,v` | `ca` | See available code actions |
| `n` | `<leader>lD` | Show buffer LSP diagnostics |
| `i` | `<C-s>` | Toggle LSP signature |
| `n` | `<leader>ls` | Toggle LSP signature |
| `n` | `<leader>ld` | Show diagnostics for line |
| `n` | `[d` | Go to previous diagnostic |
| `n` | `]d` | Go to next diagnostic |
| `n` | `K` | Show documentation for what is under cursor |
| `n` | `<leader>lk` | Show documentation for what is under cursor |
| `n` | `<leader>lr` | Restart LSP |

---

## GitSigns

**Description:** Git integration for buffers

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `]h` | Next Hunk |
| `n` | `[h` | Prev Hunk |
| `n` | `<leader>hs` | Stage hunk |
| `n` | `<leader>hr` | Reset hunk |
| `v` | `<leader>hs` | Stage hunk (visual selection) |
| `v` | `<leader>hr` | Reset hunk (visual selection) |

---

## Filenav

**Description:** File navigation history

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>gb` | Go Back in file history |
| `n` | `<leader>gn` | Go Next in file history |

---

## Aerial

**Description:** Code outline and symbol navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>a` | Aerial toggle |
| `n` | `<leader>fs` | Find document symbols |

---

## Neo-tree

**Description:** File explorer

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>eh` | Hide file explorer |

---

## Persisted

**Description:** Session management

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>pt` | Toggle Persisted Session |
| `n` | `<leader>pa` | Start Persisted Session |
| `n` | `<leader>po` | Stop Persisted Session |
| `n` | `<leader>ps` | Save Persisted Session |
| `n` | `<leader>pm` | Manage Persisted Session |

---

## Substitute

**Description:** Text substitution operations

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `_p` | Substitute with motion |
| `n` | `_pp` | Substitute line |
| `n` | `_P` | Substitute to end of line |
| `x` | `_p` | Substitute in visual mode |

---

## Copilot

**Description:** AI code assistance

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>pe` | Enable Copilot Suggestions |
| `n` | `<leader>pd` | Disable Copilot Suggestions |

---

## Copilot Chat

**Description:** AI chat interface

| Mode | Keymap | Description |
|------|--------|-------------|
| `n,v` | `<leader>pc` | Open Copilot Chat |

---

## Vim Maximizer

**Description:** Window/split maximization

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>sm` | Maximize/minimize a split |

---

## Telescope Diff

**Description:** File comparison utilities

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>wC` | Compare files (full) |
| `n` | `<leader>wc` | Compare files |

---

## Gitportal

**Description:** Git permalink generation

| Mode | Keymap | Description |
|------|--------|-------------|
| `n,v` | `<leader>gc` | Copy git permalink to clipboard |

---

## Noice

**Description:** Enhanced UI messages

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<Esc>` | Dismiss notifications |

---

## Blink (Completion)

**Description:** Completion engine keymaps configured in plugin

| Mode | Keymap | Description |
|------|--------|-------------|
| `i` | `<Tab>` | Accept suggestion or next |
| `i` | `<S-Tab>` | Previous suggestion |
| `i` | `<C-Space>` | Show completion |
| `i` | `<C-e>` | Close completion |

---

## CSV View

**Description:** CSV file navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| `n,v` | `<Tab>` | Move to next field |
| `n,v` | `<S-Tab>` | Move to previous field |
| `n,v` | `<Enter>` | Move to next row |
| `n,v` | `<S-Enter>` | Move to previous row |

---

## Custom Grep Search

**Description:** Custom grep search functionality

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>gs` | Grep search |
| `n` | `<leader>ge` | Grep search exclude text |
| `n` | `<leader>gi` | Grep search include text |
| `n` | `<CR>` | Grep search Quickfix (in quickfix window) |

---

## ToggleTerm

**Description:** Terminal integration (from keymaps.lua)

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>tt` | Toggle Terminal |

---

## Trouble

**Description:** Diagnostics list

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | Various keys | Configured with `keys` table in plugin |

---

## Snacks

**Description:** Various utility functions

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | Various keys | Configured with `keys` table in plugin |

---

## Winshift

**Description:** Window shifting

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | Various keys | Configured with `keys` table in plugin |

---

## Todo Comments

**Description:** TODO/FIXME/NOTE highlighting and search

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | Various keys | Configured via keymap variable in plugin |

---

## Nvim Window

**Description:** Window picker

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | Various keys | Configured with `keys` table in plugin |

---

## Stewart Multicursor

**Description:** Multiple cursor functionality

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | Various keys | Uses `vim.keymap.set` variable |

---

## Terminal Keybindings (from functions.lua)

**Description:** Terminal mode keybindings

| Mode | Keymap | Description |
|------|--------|-------------|
| `t` | `jk` | Exit terminal mode |
| `t` | `<C-h>` | Move to left window |
| `t` | `<C-j>` | Move to down window |
| `t` | `<C-k>` | Move to up window |
| `t` | `<C-l>` | Move to right window |
| `t` | `<C-w>` | Window command prefix |
| `t` | `<C-S>t` | Toggle terminal |

---

*Note: Some plugins use lazy-loading with `keys` tables, and their specific keybindings may need to be extracted by examining their individual plugin files more carefully for complete documentation.*
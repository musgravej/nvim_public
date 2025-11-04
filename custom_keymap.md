# Custom Keybindings - keymaps.lua

This document summarizes all custom keybindings defined in `lua/nvimuser/core/keymaps.lua`.

## Leader Key Configuration
- **Leader Key:** `<Space>`

## Table of Contents
- [General Navigation](#general-navigation)
- [Insert Mode Shortcuts](#insert-mode-shortcuts)
- [Fold Management](#fold-management)
- [Register Management](#register-management)
- [Window Management](#window-management)
- [Tab Management](#tab-management)
- [Line Movement](#line-movement)
- [Clipboard Operations](#clipboard-operations)
- [Search and Replace](#search-and-replace)
- [Page Navigation](#page-navigation)
- [Text Manipulation](#text-manipulation)
- [File Operations](#file-operations)
- [Split Resizing](#split-resizing)

---

## General Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>ss` | Suggest spelling (FzfLua) |
| `n` | `<leader>sf` | Source this file |
| `i` | `jk` | Exit insert mode |
| `i` | `;;` | Exit insert mode |
| `n` | `<leader>q` | Fast quit (alias for :q) |
| `n` | `<leader>m` | Remap mark recall |
| `n` | `<leader>nh` | Clear search highlights |
| `n` | ` ,` | Clear search highlights |
| `n` | `[e` | Previous method start |
| `n` | `]e` | Next method start |
| `n` | `[r` | Previous method end |
| `n` | `]r` | Next method end |
| `n` | `<BS>` | Move to first non-blank character |
| `n` | `<S-BS>` | Move to the end of the line |
| `n` | `n` | Search and center |
| `n` | `N` | Search and center |
| `n` | `<leader>tt` | Toggle Terminal |

---

## Insert Mode Shortcuts

| Mode | Keymap | Description |
|------|--------|-------------|
| `i` | `jk` | Exit insert mode with jk |
| `i` | `;;` | Exit insert mode with ;; |

---

## Fold Management

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `, ` | Toggle a fold |

---

## Register Management

**Standard Register Operations (with leader):**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>d` | Delete to register |
| `n` | `<leader>x` | Delete character to register |
| `n` | `<leader>X` | Delete character backward to register |
| `n` | `<leader>D` | Delete to end of line to register |
| `n` | `<leader>c` | Change to register |
| `n` | `<leader>C` | Change to end of line to register |
| `v` | `<leader>x` | Delete selection to register |
| `v` | `<leader>X` | Delete selection backward to register |
| `v` | `<leader>d` | Delete selection to register |
| `v` | `<leader>D` | Delete selection to register |
| `v` | `<leader>c` | Change selection to register |
| `v` | `<leader>C` | Change selection to register |

**Black Hole Register (default):**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `x` | Delete character to black hole |
| `n` | `X` | Delete character backward to black hole |
| `n` | `d` | Delete to black hole |
| `n` | `D` | Delete to end of line to black hole |
| `n` | `c` | Change to black hole |
| `n` | `C` | Change to end of line to black hole |
| `v` | `x` | Delete selection to black hole |
| `v` | `X` | Delete selection backward to black hole |
| `v` | `d` | Delete selection to black hole |
| `v` | `D` | Delete selection to black hole |
| `v` | `c` | Change selection to black hole |
| `v` | `C` | Change selection to black hole |

---

## Window Management

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>wsv` | Copy buffer to new vertical split |
| `n` | `<leader>wsh` | Copy buffer to new horizontal split |
| `n` | `<leader>w=` | Make split windows equal size |
| `n` | `<leader>wx` | Close current split window |
| `n` | `<leader>wk` | Move cursor right window |
| `n` | `<leader>wj` | Move cursor left window |
| `n` | `<leader>wl` | Move cursor to the last window |
| `n` | `<leader>wh` | Move cursor to the first window |
| `n` | `<leader>wu` | Move cursor up window |
| `n` | `<leader>wd` | Move cursor down window |
| `n` | `<leader>wn` | Swap window next to the right |

---

## Tab Management

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>tn` | Open new tab |
| `n` | `<leader>tc` | Close current tab |
| `n` | `<leader>tx` | Close current tab (alternative) |
| `n` | `<leader>tk` | Go to next tab |
| `n` | `<leader>tj` | Go to previous tab |
| `n` | `<leader>th` | Go to first tab |
| `n` | `<leader>tl` | Go to last tab |
| `n` | `<leader>ti` | Move tab to the right |
| `n` | `<leader>tu` | Move tab to the left |
| `n` | `<leader>tb` | Open current buffer in new tab |

---

## Line Movement

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `r]` | Move line up |
| `n` | `r[` | Move line down |
| `v` | `r]` | Move line up (Visual Mode) |
| `v` | `r[` | Move line down (Visual Mode) |
| `i` | `r]` | Move line up |
| `i` | `r[` | Move line down |

**Mac-specific alternatives:**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<C-S-i>` | Move line up |
| `n` | `<C-S-k>` | Move line down |
| `v` | `<C-S-i>` | Move line up (Visual Mode) |
| `v` | `<C-S-k>` | Move line down (Visual Mode) |
| `i` | `<C-S-i>` | Move line up |
| `i` | `<C-S-k>` | Move line down |

---

## Clipboard Operations

**Mac (System Clipboard - `*` register):**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>cL` | Copy line to clipboard (with CRLF) |
| `v` | `<leader>cL` | Copy selection to clipboard (with CRLF) |
| `n` | `<leader>cl` | Copy line to clipboard (without CRLF) |
| `v` | `<leader>cl` | Copy selection to clipboard (without CRLF) |
| `n` | `<leader>cc` | Clipboard Copy |
| `v` | `<leader>cc` | Clipboard Copy |
| `n` | `<leader>cw` | Clipboard Copy this word |
| `n` | `<leader>cp` | Clipboard Paste |
| `v` | `<leader>cp` | Clipboard Paste |
| `n` | `<leader>cf` | Copy entire file |
| `v` | `<leader>cf` | Copy entire file |
| `n` | `<leader>pl` | Paste line below from clipboard |
| `n` | `<leader>Pl` | Paste line above from clipboard |

**Linux (System Clipboard - `+` register):**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>cL` | Copy line to clipboard (with CRLF) |
| `v` | `<leader>cL` | Copy selection to clipboard (with CRLF) |
| `n` | `<leader>cl` | Copy line to clipboard (without CRLF) |
| `v` | `<leader>cl` | Copy selection to clipboard (without CRLF) |
| `n` | `<leader>cc` | Clipboard Copy |
| `v` | `<leader>cc` | Clipboard Copy |
| `n` | `<leader>cw` | Clipboard Copy this word |
| `n` | `<leader>cp` | Clipboard Paste |
| `v` | `<leader>cp` | Clipboard Paste |
| `n` | `<leader>cf` | Copy entire file |
| `v` | `<leader>cf` | Copy entire file |
| `n` | `<leader>pl` | Paste line below from clipboard |
| `n` | `<leader>Pl` | Paste line above from clipboard |

---

## Search and Replace

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>srl` | Search and replace on line |
| `n` | `<leader>srf` | Search and replace on file |
| `v` | `<leader>srv` | Search and replace (visual selection only) |
| `v` | `<leader>c*` | Change selection text (whole file) |
| `v` | `<leader>c#` | Change selection text (with confirmation) |

---

## Page Navigation

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<C-S-d>` | Scroll up and center |
| `n` | `<C-d>` | Scroll down and center |
| `n` | `<C-b>` | Scroll back and center |
| `n` | `<C-f>` | Scroll forward and center |

---

## Text Manipulation

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>rl` | Repeat current line above |
| `n` | `<leader>rp` | Paste from register prompt |
| `n` | `<leader>yy` | Convenience yank to start of line |
| `n` | `<leader>yY` | Convenience yank to end of line |

---

## File Operations

| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<leader>www` | Write file |

---

## Split Resizing

**Using Tab + hjkl keys:**
| Mode | Keymap | Description |
|------|--------|-------------|
| `n` | `<Tab>k` | Resize window height + |
| `n` | `<Tab>i` | Resize window height - |
| `n` | `<Tab>l` | Resize window width + |
| `n` | `<Tab>j` | Resize window width - |

---

## Key Design Patterns

### Mnemonics Used:
- **`c`** = Copy/Change/Clipboard
- **`f`** = Find/File
- **`g`** = Go/Git
- **`h`** = Harpoon
- **`l`** = LSP/Line
- **`p`** = Paste/Project
- **`r`** = Replace/Repeat/Register
- **`s`** = Search/Source/Split
- **`t`** = Tab/Toggle/Terminal
- **`w`** = Window/Write

### Register Strategy:
- Default operations (`d`, `c`, `x`) use black hole register (`"_`) to preserve clipboard
- Leader prefixed operations (`<leader>d`, `<leader>c`, etc.) use normal registers
- Clipboard operations explicitly use system clipboard (`"*` on Mac, `"+` on Linux)

### Platform Differences:
- Mac uses `"*` register for system clipboard
- Linux uses `"+` register for system clipboard
- Mac has additional `<C-S-i>` and `<C-S-k>` bindings for line movement

---

*This configuration emphasizes mnemonic keybindings and preserves the system clipboard by redirecting common delete/change operations to the black hole register by default.*

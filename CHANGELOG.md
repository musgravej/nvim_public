# Neovim Configuration Changelog

All notable changes to this Neovim configuration will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **lspconfig.lua**: Added support for python-lsp-server (pylsp)
  - **Alternative**: Added pylsp as Python LSP server option alongside pyright
  - **Configuration**: Migrated existing pylsp settings to match previous configuration
  - **Features**: 
    - Black formatter with 120-character line length
    - Flake8 linting with E202 ignore rule
    - Jedi completion with parameters and eager loading
    - All Jedi features enabled (hover, references, signature help, symbols)
    - Disabled pylint, pyflakes, pycodestyle in favor of flake8
    - Custom diagnostic handlers (underline enabled, virtual text disabled)
  - **Installation Required**: 
    ```bash
    # Basic installation
    pip install python-lsp-server
    
    # With all optional features
    pip install python-lsp-server[all]
    
    # Additional plugins for enhanced functionality
    pip install python-lsp-black python-lsp-isort pylsp-mypy
    ```
  - **Note**: Pyright remains available as commented alternative for easy switching

### Fixed
- **lspconfig.lua**: Resolved "attempt to call field 'setup_handlers' (a nil value)" error
  - **Root Cause**: `setup_handlers` method has been removed/deprecated in newer mason-lspconfig versions
  - **Solution**: Updated to modern mason-lspconfig API that directly configures LSP servers via lspconfig
- **lspconfig.lua**: Resolved "`require('lspconfig')` framework is deprecated" warning
  - **Root Cause**: Neovim 0.11+ deprecated the old lspconfig approach in favor of built-in `vim.lsp.config`
  - **Solution**: Migrated to modern `vim.lsp.config` API with fallback to lspconfig for older versions
  - Added proper dependencies for `mason.nvim` and `mason-lspconfig.nvim` to ensure correct loading order
  - Enhanced error messages to provide better debugging information

### Changed
- **lspconfig.lua**: Updated dependencies array to include:
  - `"williamboman/mason.nvim"`
  - `"williamboman/mason-lspconfig.nvim"`
- **lspconfig.lua**: Migrated from deprecated `setup_handlers` to direct server setup approach
- **lspconfig.lua**: Migrated from deprecated `require('lspconfig')` to modern `vim.lsp.config` API
- **lspconfig.lua**: Added version detection with fallback support for older Neovim versions
- **lspconfig.lua**: Added configuration for additional LSP servers:
  - bashls (Bash)
  - html (HTML) 
  - cssls (CSS)
  - terraformls (Terraform)
- **lspconfig.lua**: Enhanced server configurations with proper cmd, filetypes, and root_markers for modern API

### Technical Details
- **Issue 1**: LSP configuration was failing with "setup_handlers method not available" error
- **Discovery 1**: `mason-lspconfig.setup_handlers` method no longer exists in current version
- **Issue 2**: New deprecation warning for `require('lspconfig')` framework in Neovim 0.11+
- **Discovery 2**: Neovim 0.11+ provides built-in `vim.lsp.config` API replacing nvim-lspconfig
- **Available Methods**: `get_available_servers`, `get_installed_servers`, `get_mappings`, `setup`
- **Modern Approach**: 
  - Primary: Use `vim.lsp.config` for Neovim 0.11+ (future-proof)
  - Fallback: Use `lspconfig` for older Neovim versions (backward compatible)
- **Servers Configured**: lua_ls, pyright, jsonls, bashls, html, cssls, terraformls
- **Added Features**: Proper cmd, filetypes, root_markers, and capabilities for each server

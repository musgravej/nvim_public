-- Bare configuration file, config will be done in lspconfig setup
return {
  -- Command to start the LSP server
  cmd = { 'lua-language-server' },
  -- Filetypes this LSP should attach to
  filetypes = { 'lua' },
}

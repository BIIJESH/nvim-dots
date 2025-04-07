vim.lsp.start({
  name = 'lua-language-server',
  cmd = { 'lua-language-server' },
  root_dir = vim.fs.dirname(vim.fs.find({ '.luarc.json', '.git', 'init.lua' }, { upward = true })[1]),
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- or 'Lua 5.1', etc.
      },
      diagnostics = {
        globals = { 'vim' }, -- so it doesn't complain about `vim`
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    }
  }
})

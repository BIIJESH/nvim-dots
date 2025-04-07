vim.lsp.config.gopls = {
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  },
}
vim.lsp.enable("gopls")

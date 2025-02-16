require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
local client = vim.lsp.start_client {
  name = "educationalsp",
  cmd = { "/home/papa/educationalsp/main" },
  on_attach = function(client, bufnr)
    print("LSP server attached!")
  end,
}

if not client then
  vim.notify("LSP client failed to start!")
  return
end

-- Autocmd to attach the LSP client to markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.lsp.buf_attach_client(0, client)
  end,
})

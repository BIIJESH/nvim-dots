vim.lsp.config("*", {
  root_makers = { ".git" },
})

require("lsp.ts_ls")
require("lsp.tailwindcss")
require("lsp.python").setup()


-- lua/lsp/python.lua
local M = {}
function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      local clients = vim.lsp.get_clients({ name = "pyright" })
      if #clients == 0 then
        vim.lsp.start({
          name = "pyright",
          cmd = { "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_dir = vim.fs.dirname(vim.fs.find({
            "pyproject.toml", ".git", "setup.py",
            "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json"
          }, { upward = true })[1]),
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",  -- enable full diagnostics
              },
            },
          },
        })
      end
    end
  })
end

return M

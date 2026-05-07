require("config.options")
require("lsp")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

-- local parser_path = vim.env.HOME .. "/.local/share/tree-sitter"
local parser_path = vim.loop.os_homedir() .. "/.local/share/tree-sitter/"

vim.treesitter.language.add(
    'tsx',
    { path = parser_path .. 'tree-sitter-typescript/tsx/parser.dylib' }
)
vim.treesitter.language.add(
    'typescript',
    { path = parser_path .. 'tree-sitter-typescript/typescript/parser.dylib' }
)
vim.treesitter.language.add(
    'python',
    { path = parser_path .. 'tree-sitter-python/python.dylib' }
)
vim.treesitter.language.add(
    'html',
    { path = parser_path .. 'tree-sitter-html/html.dylib' }
)
vim.treesitter.language.add(
    'css',
    { path = parser_path .. 'tree-sitter-css/css.dylib' }
)
vim.treesitter.language.add(
    'javascript',
    { path = parser_path .. 'tree-sitter-javascript/javascript.dylib' }
)

vim.treesitter.language.register('tsx', { 'typescriptreact' })

vim.cmd([[
  " Number replacements
  iabbrev one 1
  iabbrev two 2
  iabbrev three 3
  iabbrev four 4
  iabbrev seven 7

  " Symbol replacements
  iabbrev exclam !
  iabbrev atsym @
  iabbrev hash #
  iabbrev dollar $
  iabbrev andsym &
]])

vim.lsp.config("*", {
	root_makers = { ".git" },
})

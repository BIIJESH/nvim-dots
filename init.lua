require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")

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

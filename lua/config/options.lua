-- Use locals for better organization
local api = vim.api
local opt = vim.opt
local g = vim.g
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
local filetype = vim.filetype
-- Always show the statusline
opt.showmode = true
g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- General settings
opt.scrolloff = 4
g.vim_be_good_log_file = 1
opt.autoread = true
opt.autowriteall = false
opt.showcmd = false
opt.laststatus = 2
opt.formatoptions:remove({ "c", "r", "o" })
opt.cursorline = true
opt.number = true
opt.title = true
opt.backspace = "2"
opt.hlsearch = true
opt.ignorecase = false

-- Backup and swapfile settings
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Split window behavior
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

-- Indentation settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.shiftround = true
opt.expandtab = true

-- Netrw settings
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Clipboard settings
opt.clipboard:append("unnamedplus")

-- Word wrapping settings
opt.wrap = true
opt.linebreak = true

-- Relative line numbers
opt.relativenumber = true
g.netrw_syntax_highlight = 1
-- Filetype customization
filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single", -- You can use "single", "double", "solid", "shadow", etc.
})

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyBufferline()"

function MyBufferline()
    local buffers = vim.api.nvim_list_bufs()
    local result = ""
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
            local bufname = vim.api.nvim_buf_get_name(buf)
            bufname = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

            local bufnum = vim.api.nvim_buf_get_number(buf)
            local is_active = (bufnum == vim.api.nvim_get_current_buf())
            if is_active then
                result = result .. " %#TabLineSel#[" .. bufname .. "]%#TabLine# "
            else
                result = result .. " [" .. bufname .. "] "
            end
        end
    end
    return result ~= "" and result or "%#TabLineFill# No Buffers %#TabLine#"
end


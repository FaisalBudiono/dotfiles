vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

-- Change file format to unix (lf)
vim.opt.ff = "unix"
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Line limit before scrolling
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "72,80,100"

vim.opt.splitbelow = true
vim.opt.splitright = true

-- To help autocomplete in command mode
vim.opt.ignorecase = true

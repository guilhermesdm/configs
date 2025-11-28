local opt = vim.opt

opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.expandtab = true -- use spaces instead of tabs
opt.relativenumber = true -- show relative line numbers
opt.signcolumn = "yes" -- always show sign column
opt.numberwidth = 6 -- set number column width
opt.shiftwidth = 2 -- number of spaces to use for autoindenting
opt.swapfile = false -- disable swap files
opt.showmode = true

vim.opt.modelines = 0
vim.opt.undofile = true
vim.o.scrolloff = 13
vim.opt.backspace = "indent,eol,start"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true

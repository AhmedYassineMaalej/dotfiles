vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.termguicolors = true

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- convert tabs to spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- how to display whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

-- sync vim clipboard to OS clipboard
vim.o.clipboard = "unnamedplus"

-- always reserve space for signs next to number line
vim.o.signcolumn = "yes"

-- Save undo history
vim.o.undofile = true

-- Enable break indent
vim.o.breakindent = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Number of visible lines at top and bottom when scrolling
vim.o.scrolloff = 10

-- Remove native status line
vim.opt.showmode = false

vim.opt.title = true

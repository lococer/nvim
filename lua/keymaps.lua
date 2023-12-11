vim.g.mapleader = " "
local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}
keymap('n','<f2>',':lua Open_initfile()<CR>',opts)
keymap("i","jk","<Esc>l",opts)
--keymap("v","jk","<Esc>l",opts)

keymap("v","J",":m '>+1<CR>gv=gv")
keymap("v","K",":m '<-2<CR>gv=gv")
keymap("n","<leader>\\","<C-w>v")
keymap("n","<leader>|","<C-w>s")
keymap("n","<leader>nh",":nohl<CR>")



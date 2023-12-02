
function Open_initfile()
	local init_path="C:\\Users\\luozh\\Appdata\\Local\\nvim\\init.lua"
	-- vim.cmd("command! e "..init_path)
	-- vim.api.nvim_exec([[
	-- 	edit C:\\Users\\luozh\\Appdata\\Local\nvim\\init.lua
	-- ]],false)
	-- vim.api.nvim_exec("edit "..init_path,false)
    vim.cmd("edit "..init_path)
end


vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.termguicolors = true
vim.o.signcolumn = "yes"



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

--- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options

require("lazy").setup({
    {
        "folke/which-key.nvim"
    },
    {
        "folke/neoconf.nvim", 
        cmd = "Neoconf" 
    },
    {
        "folke/neodev.nvim"
    },
    {
        "folke/tokyonight.nvim",
        dependencies = "kyazdani42/nvim-web-devicons" 
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight"
                },
                vim.cmd[[colorscheme tokyonight-moon]]
            })
        end
    },     
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            vim.keymap.set("n","<leader>",":NvimTreeToggle<CR>")
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        	require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
		})
        end 
    },
    {
        "christoomey/vim-tmux-navigator",
        "nvim-treesitter/nvim-treesitter",
        "p00f/nvim-ts-rainbow",
    },
})
--local api = require "nvim-tree.api"
--keymap("n","<leader>e",api.tree.toggle())

--require("nvim-tree").setup({
    --sort = {
        --sorter = "case_sensitive",
    --},
    --view = {
        --width = 30,
    --},
    --renderer = {
        --group_empty = true,
    --},
    --filters = {
        --dotfiles = true,
    --},   
--})

--vim.apt.nvim_exec("colorscheme tokyonight-moon",false)


--[[
require("lazy").setup({
	"neovim/nvim-lspconfig",
	"sumneko/lua-language-server",
})
]]--


--- the core setup for neovim
require("setup") -- bacsic setup
require("keymaps") -- all keymaps
require("user_function") -- functions defined by myself

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
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
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
            vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>")
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
        -- 括号匹配
        "nvim-treesitter/nvim-treesitter",
        dependencies = "p00f/nvim-ts-rainbow",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"vim", "bash", "c", "cpp", "javascript", "json", "lua", "python"},
                highlight = { enable = true},
                indent = {enable = true},

                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
            })
        end
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    "christoomey/vim-tmux-navigator",
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
})

require("plugins/setup")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", },
})

local on_attach = function(_, _)
    vim.keymap.set('n','<leader>rn',vim.lsp.buf.rename,{})
    vim.keymap.set('n','<leader>ca',vim.lsp.buf.code_action,{})
    vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
    vim.keymap.set('n','gi',vim.lsp.buf.implementation,{})
    vim.keymap.set('n','gr',require("telescope.builtin").lsp_references,{})
    vim.keymap.set('n','K',vim.lsp.buf.hover,{})
end

require("lspconfig").lua_ls.setup({
    on_attach = on_attach
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

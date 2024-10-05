return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},

	{ "nvim-telescope/telescope.nvim" },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = 0,
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"cuda",
					"diff",
					"go",
					"html",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"printf",
					"python",
					"query",
					"regex",
					"rust",
					"sql",
					"textproto",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
				},
			})
		end
	},
    {
        "neovim/nvim-lspconfig",
        dependencies = {
        },
        config = function()
            require("lspconfig").rust_analyzer.setup {}
        end,
        opts = {
            servers = {
            }
        }
    },
	
	--{
	--	"nvim-telescope/telescope-file-browser.nvim",
	--	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	--}
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("lualine").setup {}
        end,
    }
}

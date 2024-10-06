return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = 0,
        keys = {
            { "<c-space>", desc = "Increment Selection" },
            { "<bs>",      desc = "Decrement Selection", mode = "x" },
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
                    "css",
                    "cuda",
                    "diff",
                    "go",
                    "html",
                    "java",
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
                    "zig",
                },
            })
        end
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
                PATH = "append"
            }
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "clangd",
                    "gopls",
                    "lua_ls",
                    "rust_analyzer"
                },
            }
        end
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup {}
            lspconfig.gopls.setup {}
            lspconfig.lua_ls.setup {}
            lspconfig.rust_analyzer.setup {}
        end,
        opts = {
            servers = {
            }
        }
    },

    {
        -- Auto-format
        'stevearc/conform.nvim',
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },

    {
        -- Completion
        'echasnovski/mini.completion',
        version = false,
        config = function()
            require('mini.completion').setup()
            -- Don't allow completion window to eat <CR>
            local keycode = vim.keycode or function(x)
                return vim.api.nvim_replace_termcodes(x, true, true, true)
            end
            local keys = {
                ['cr']        = keycode('<CR>'),
                ['ctrl-y']    = keycode('<C-y>'),
                ['ctrl-y_cr'] = keycode('<C-y><CR>'),
            }

            _G.cr_action = function()
                if vim.fn.pumvisible() ~= 0 then
                    -- If popup is visible, confirm selected item or add new line otherwise
                    local item_selected = vim.fn.complete_info()['selected'] ~= -1
                    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
                else
                    -- If popup is not visible, use plain `<CR>`. You might want to customize
                    -- according to other plugins. For example, to use 'mini.pairs', replace
                    -- next line with `return require('mini.pairs').cr()`
                    return keys['cr']
                end
            end

            vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })
        end
    },

}

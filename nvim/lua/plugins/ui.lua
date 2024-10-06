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
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require("bufferline").setup {
                options = {
                    show_buffer_close_icons = false,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true
                        },
                        {
                            filetype = "undotree",
                            text = "Undo Tree",
                            highlight = "Directory",
                            separator = true
                        }

                    },

                    --diagnostics = false | "nvim_lsp" | "coc",
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, _, _)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                }
            }
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
    },


    --{
    --    "jiaoshijie/undotree",
    --    dependencies = "nvim-lua/plenary.nvim",
    --    config = true,
    --    keys = { -- load the plugin only when using it's keybinding:
    --        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    --    },
    --}
    {
        "debugloop/telescope-undo.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            {
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.7,
                            vertical = {
                                preview_cutoff = 1,
                            }
                        },
                        mappings = {
                            i = {
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            },
                            n = {
                                ["y"] = require("telescope-undo.actions").yank_additions,
                                ["Y"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            },
                        },
                    },
                },
            })
            require("telescope").load_extension("undo")
        end,
    },

    {
        "ErichDonGubler/lsp_lines.nvim",
        config = function()
            local lsp_lines = require("lsp_lines")
            lsp_lines.setup()
            vim.keymap.set(
                "",
                "<Leader>l",
                lsp_lines.toggle,
                { desc = "Toggle lsp_lines" }
            )
            vim.diagnostic.config({
                virtual_lines = false
            })
        end,
    },
}

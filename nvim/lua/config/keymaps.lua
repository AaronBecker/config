local set_keymap = vim.keymap.set

-- \e -> :e in current buffer's directory
set_keymap('n', '<leader>e',
    function()
        return ':e ' .. vim.fn.expand("%:p:h") .. '/'
    end,
    { noremap = true, expr = true })

-- Telescope
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep theme=dropdown<cr>')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers theme=dropdown<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags theme=dropdown<cr>')
set_keymap('n', '<leader>fu', '<cmd>Telescope undo<cr>')
set_keymap('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')

-- NvimTree
set_keymap('n', '<leader>t', '<cmd>NvimTreeToggle<cr>')

-- MiniCompletion
vim.api.nvim_create_user_command('MiniCompletionEnable', function()
    vim.g.minicompletion_disable = false
end, {})
vim.api.nvim_create_user_command('MiniCompletionDisable', function()
    vim.g.minicompletion_disable = true
end, {})

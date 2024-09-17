local set_keymap = vim.keymap.set

-- \e -> :e in current buffer's directory
set_keymap('n', '<leader>e',
    function()
        return ':e ' .. vim.fn.expand("%:p:h") .. '/'
    end,
    { noremap = true, expr = true })
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags')

set_keymap('n', '<leader>t', '<cmd>NvimTreeToggle<cr>')



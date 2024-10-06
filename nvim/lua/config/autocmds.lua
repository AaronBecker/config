local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight current line on active window only
local active_line_highlight = augroup('HighlightActiveLine', { clear = true })

autocmd('WinEnter', {
    desc = 'show cursorline',
    callback = function() vim.wo.cursorline = true end,
    group = active_line_highlight
})

autocmd('WinLeave', {
    desc = 'hide cursorline',
    callback = function() vim.wo.cursorline = false end,
    group = active_line_highlight
})

autocmd('TextYankPost', {
    desc = 'highlight yanked text',
    callback = function() vim.highlight.on_yank() end,
})

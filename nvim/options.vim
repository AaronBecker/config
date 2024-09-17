set number
set cursorline
set scrolloff=4
set nowrap

set smarttab
set tabstop=4
set shiftwidth=4

set incsearch
set nohlsearch
set ignorecase
set smartcase

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

filetype plugin indent on

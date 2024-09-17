
local options = {
    mouse = 'a',
	background = 'dark',

    wildmenu = true,
    wildmode = 'longest:full',

	number = true,
	cursorline = true,
	scrolloff = 4,
	wrap = false,

	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,

	incsearch = true,
	hlsearch = false,
	ignorecase = true,
	smartcase = true,
}

local global_options = vim.o
for option, value in pairs(options) do
	global_options[option] = value
end

vim.cmd("filetype plugin indent on")

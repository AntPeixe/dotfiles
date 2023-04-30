local set = vim.opt

set.mouse = ""           -- disable mouse

set.termguicolors = true -- true colors
set.cursorline = true    -- highlight cursor line
set.showmode = false     -- don"t show mode

set.wrap = false         -- don"t wrap lines
set.scrolloff = 10       -- keep lines when scrolling

set.timeoutlen = 500
set.updatetime = 100

-- tabs
set.expandtab = true -- tabs are spaces
set.tabstop = 4      -- number of visual spaces per tab
set.shiftwidth = 4   -- use 4 spaces when indenting with >
set.softtabstop = 4  -- tabs as 4 spaces

-- line numbers
set.relativenumber = true -- relative numbers
set.number = true         -- line numbers
set.signcolumn = "yes:2"  -- fix signcolumn with 2 columns

set.smartindent = true    -- auto indent new lines
set.showmatch = true      -- show match parenthesis/bracket
set.ic = true             -- ignore case when searching

-- splitting
set.splitright = true -- split window to right
set.splitbelow = true -- split window to below

-- appearance
set.background = "dark"                     -- dark background
vim.cmd [[highlight Normal guibg=none]]     -- transparent background
vim.cmd [[highlight ColorColumn ctermbg=1]] -- column 121 highlight
set.colorcolumn = "80,120"

-- make files should not expand tabs to spaces
vim.cmd [[autocmd FileType make setlocal noexpandtab]]

-- show trailing whitespaces and tabs
set.lcs                     = "tab:>-,trail:-"

-- undo
-- undo persists after exiting file
set.undodir                 = os.getenv("HOME") .. "/.cache/nvim/undo"
set.undofile                = true -- see :help undodir and :help undofile

set.hidden                  = false -- hide [No Name] buffers

-- Point to python3 to help load times
vim.g["python3_host_prog"]  = "/usr/bin/python3"

-- make sure `dockerfile` (lower case D) is detected as dockerfile type
vim.cmd [[ autocmd BufRead,BufNewFile *dockerfile* set filetype=dockerfile ]]
vim.cmd [[ autocmd BufRead,BufNewFile dockerfile set filetype=dockerfile ]]

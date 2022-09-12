local set = vim.opt

set.timeoutlen = 500
set.syntax = "on"           -- enable syntax
set.updatetime = 100

-- tabs
set.expandtab = true        -- tabs are spaces
set.tabstop = 4             -- number of visual spaces per tab
set.shiftwidth = 4          -- use 4 spaces when indenting with >
set.softtabstop = 4         -- tabs as 4 spaces

-- line numbers
set.relativenumber = true   -- relative numbers
set.number = true           -- line numbers
set.signcolumn = "yes:2"    -- fix signcolumn with 2 columns

vim.cmd [[filetype plugin indent on]]   -- file type detection
set.smartindent = true      -- auto indent new lines
set.showmatch = true        -- show match parenthesis/bracket
set.ic = true               -- ignore case when searching

-- splitting
set.splitright = true       -- split window to right
set.splitbelow = true       -- split window to below

-- make files should not expand tabs to spaces
vim.cmd [[autocmd FileType make setlocal noexpandtab]]

-- show trailing whitespaces and tabs
set.lcs="tab:>-,trail:-"

-- undo
-- undo persists after exiting file
set.undodir  = os.getenv("HOME") .. '/.cache/nvim/undo'
set.undofile = true                -- see :help undodir and :help undofile

set.diffopt.extends="vertical" 	   -- diff vertical split for easier comparison

-- netrw tweaks
vim.g["netrw_liststyle"] = 3
vim.g["netrw_banner"] = 0
vim.g["netrw_browse_split"] = 4
vim.g["netrw_winsize"] = 25

set.hidden = false  -- hide [No Name] buffers

-- Point to python3 to help load times
vim.g["python3_host_prog"] = "/usr/bin/python3"

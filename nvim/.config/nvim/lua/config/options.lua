local opt = vim.opt

-- Hint: use `:h <option>` to figure out the meaning if needed

-- UI config
opt.number = true -- show absolute number
opt.relativenumber = true -- add numbers to each line on the left side
opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
opt.wrap = false -- do not wrap lines by default
opt.scrolloff = 10 -- keep 10 lines abobe/below cursor
opt.sidescrolloff = 8 -- keep 8 columns to left/right of cursor

-- Tabs / Indentation
opt.tabstop = 4 -- number of visual spaces per TAB
opt.softtabstop = 4 -- number of spaces in tab when editing
opt.shiftwidth = 4 -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly becauPython
opt.smartindent = true -- smart auto-indent
opt.autoindent = true -- copy indent from current line

-- Searching
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is entered
opt.hlsearch = true -- highlight matches
opt.incsearch = true -- search as characters are entered
opt.selection = "inclusive" -- include last characert in selection

-- UI settings
opt.termguicolors = true -- Enable 24-bit colors
opt.signcolumn = "yes" -- Always show sign column
opt.showmatch = true -- highlight matching brackets
opt.cmdheight = 1 -- Command line cmdheight
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.completeopt = "menu,menuone,noinsert,noselect" -- Ensures the menu appers even for single matches and uses the native popup window
opt.autocomplete = false -- Enables the overall completion relativenumber

opt.selection = "inclusive" -- include last character in selection
opt.showmode = true -- Show mode (newbie here)

-- File handling
opt.backup = false -- do not create a backup file
opt.writebackup = false -- do not write to a backup file
opt.swapfile = false -- do not create a swapfile
opt.undofile = true -- do create an undo file
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo directory
opt.updatetime = 300 -- faster completion
opt.timeoutlen = 500 -- timeout duration
opt.ttimeoutlen = 50 -- key code timeout
opt.autoread = true -- auto-reload changes if outside of neovim
opt.autowrite = false -- do not auto-save

-- Behavior settings
opt.hidden = true -- Allow hidden buffers
opt.errorbells = false -- No error bells
opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.autochdir = false -- Don't auto change directory
opt.iskeyword:append("-") -- Treat dash as part of word
opt.path:append("**") -- include subdirectories in search
opt.mouse = "a" -- Enable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.modifiable = true -- Allow buffer modifications
opt.encoding = "UTF-8" -- Set encoding

-- Folding settings
opt.smoothscroll = true
opt.foldmethod = "expr"
opt.foldlevel = 99 -- Start with all folds open
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.fillchars = {
	foldopen = " ",
	foldclose = " ",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen"

-- set undo directory
local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

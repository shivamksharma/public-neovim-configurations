local opt = vim.opt

opt.syntax = "on"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.shell = "/bin/bash"
opt.history = 500

-- Indenting
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.copyindent = true

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.smarttab = true
opt.softtabstop = 2

opt.shiftwidth = 2
opt.textwidth = 120
opt.backspace = "start,eol,indent"
opt.fillchars = { eob = " " }
opt.wrap = false
opt.ruler = true
vim.cmd("filetype plugin indent on")
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"

-- Searching
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.wildmenu = true
opt.wildmode = { "longest", "full" }
opt.wildignore = "*.o,*.class,*.pyc,*.so,*.obj,*.bak,*.swp, */node_modules/*"
-- opt.wildchar = '<TAB>'
opt.path:append({ "**" })

opt.timeoutlen = 400
opt.ttimeoutlen = 10
opt.updatetime = 250
opt.showmode = false
-- vim.o.comments = ""
-- opt.formatoptions:append({ "r" })

-- opt.colorcolumn = "80"
opt.cursorline = true
opt.signcolumn = "yes"
opt.background = "dark"
opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.ttyfast = true
-- opt.inccommand = 'split'
-- opt.cmdheight = 1
-- opt.showcmd = true
-- opt.autowrite = true
-- opt.confirm = true

opt.title = true
opt.hidden = true
opt.compatible = false
opt.modeline = true
opt.modelines = 2
opt.lazyredraw = true
opt.laststatus = 3
opt.magic = true
opt.startofline = false
opt.switchbuf = "useopen"

opt.mouse = "nvic"
opt.mousehide = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.errorbells = false
opt.visualbell = false
opt.autoread = true
opt.clipboard = { "unnamedplus", "unnamed" }

-- Other Options --

-- disable nvim intro
opt.shortmess:append("sI")

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

opt.spell = false
-- vim.opt.complete:append = 'kspell'
-- vim.opt.spelllang = 'en_us'
-- vim.opt.spellsuggest = 'best,5'
-- vim.opt.completeopt = {"menuone", "preview", "noinsert"}

-- FOLDING
-- opt.foldopen = 'hor, insert, jump, mark, percent, quickfix, search, tag, undo'
-- opt.foldenble = true
-- opt.foldmethod = syntax
-- opt.foldlevelstart = 1

opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.backupdir = "~/.config/nvim/backups"
-- vim.opt.undofile = false
-- vim.opt.undodir = "~/.config/nvim/undodir"

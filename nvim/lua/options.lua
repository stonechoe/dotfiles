vim.g.mapleader = ","

vim.g.netrw_winsize = 20
vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 1
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
vim.g.netrw_keepdir = 0

local o = vim.opt

o.clipboard = "unnamedplus" -- copy/paste to system clipboard
o.swapfile = false -- don't create swap files
o.showmode = false -- don't show mode on cmd line, we have statusline for that
o.laststatus = 3 -- global statusline
o.signcolumn = "yes" -- always show sign column
o.termguicolors = true -- enable true colors
o.timeoutlen = 400 -- time to wait for a mapped sequence to complete
o.undofile = true -- persistent undo
o.splitbelow = true
o.splitright = true
o.updatetime = 250 -- interval for writing swap file to disk, also used by gitsigns
o.cursorline = true

o.cmdheight = 1
o.showmatch = true
o.smarttab = true
o.smartindent = true

-- search
o.incsearch = true
o.hlsearch = true

-- mouse
o.mouse = "a"
o.mousescroll = "ver:1,hor:2"
-- o.scrolloff=9999

-- Folding
o.foldlevel = 20
o.foldenable = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after moving down half-page"})

-- Spell
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Search
o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
o.ruler = false
-- uncomment both line to show relative & absolute
-- o.relativenumber = true
-- o.statuscolumn = "%s %l %r "

-- o.scrolloff=999


local default_disable_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  --"netrw",
  --"netrwPlugin",
  --"netrwSettings",
  --"netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
}

for _, plugin in pairs(default_disable_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

local default_disable_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_disable_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

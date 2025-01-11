-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

--- Disable hiding of markup
opt.conceallevel = 0
-- Common settings {{{

-- For using local .exrc files
opt.exrc = true
opt.secure = true

-- Indent, tabs, spaces
opt.ts = 4
opt.cindent = true
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4

opt.autowrite = true
opt.backup = true
opt.backspace = { "start", "eol", "indent" }
vim.o.whichwrap = vim.o.whichwrap .. "b,s,<,>,[,]"
opt.listchars = { tab = "»·", trail = "·", nbsp = "‗", extends = "…", eol = "↴" }

opt.textwidth = 0
opt.linebreak = true
opt.wrap = true
-- Show marker for breaked lines
opt.showbreak = "↪"

-- Search options
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Highlight the current line
opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- Use movement commands with ~ : ~w - change word register
opt.tildeop = true

-- }}}

-- Spelling {{{

opt.spelllang = { "en", "uk", "ru_yo" }
opt.spell = true

-- }}}

-- Support Cyrillic mapping {{{

-- see also https://github.com/Wansmer/langmapper.nvim

local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ua_shift = [[~ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
-- without ',.' и 'бю'
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ua = [[`йцукенгшщзхъфывапролджэячсмить]]

vim.opt.langmap = vim.fn.join({
  --  ; -  не треба екранувати
  --  |
  escape(ua_shift)
    .. ";"
    .. escape(en_shift),
  escape(ua) .. ";" .. escape(en),
}, ",")

-- }}}

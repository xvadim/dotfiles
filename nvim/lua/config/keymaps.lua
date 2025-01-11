-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local km = vim.keymap

-- " move inside long lines with j/k
km.set("n", "j", "gj", { noremap = true, silent = true, desc = "Line down inside a long line" })
km.set("n", "k", "gk", { noremap = true, silent = true, desc = "Line up inside a long line" })

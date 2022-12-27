-- !REMAPS
vim.g.mapleader = ","


-- Key "v" is for vim defaut commands
-- Key "c" is for custom commands

-- File Manager
vim.keymap.set("n", "<leader>vf", vim.cmd.Ex)
-- Spell Checker
vim.keymap.set("n", "<leader>cs", ":set spell spelllang=es_es<CR>")
-- Set formatting using lsp
vim.keymap.set("n", "<leader>vfo", vim.lsp.buf.format)

-- Default Overwrites

-- Center cursor after page up or down
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Send some defaults to jail
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<nop>")
vim.keymap.set("n", "<C-b>", "<nop>")

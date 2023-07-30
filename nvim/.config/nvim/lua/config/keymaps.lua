vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- faster save and quit
vim.keymap.set("n", "<c-s>", ":w<cr>", { desc = "save" })
vim.keymap.set("n", "<c-q>", ":q<cr>", { desc = "quit" })
vim.keymap.set("i", "<c-s>", ":w<cr>", { desc = "save" })

-- remove highlight
vim.keymap.set("n", "<bs>", "<cmd>nohlsearch<cr>", { desc = "remove search highlights" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "yank to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "paste from clipboard" })

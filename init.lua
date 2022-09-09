require("plugins")()

-- Mappings --

local map = vim.keymap.set


map("n", "<CR>", ":w<CR>")
-- H / L for start / end of line
map("n", "<s-h>", "^")
map("n", "<s-l>", "$")

-- go to previous buffer
map("n", "-", "<c-^>")

map("n", "<space>", ":call VSCodeNotify('whichkey.show')<cr>")

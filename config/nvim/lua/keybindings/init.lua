vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- bufferline next prev
map("n", "<tab>", ":bnext<CR>", { noremap = true, silent = false })
map("n", "<s-tab>", ":bprevious<CR>", { noremap = true, silent = false })
--
-- tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

map("i", "jk", "<ESC>", { noremap = true, silent = false })
map("i", "jk", "<ESC>", { noremap = true, silent = false })

map("v", "jk", "<ESC>", { noremap = true, silent = false })
map("v", "jk", "<ESC>", { noremap = true, silent = false })

map("n", "v", "V", { noremap = true, silent = false })
map("n", "v", "V", { noremap = true, silent = false })

map("n", "<leader>ñ", ">>", { noremap = true, silent = false })
map("n", "ñ", "<<", { noremap = true, silent = false })

map("v", "<leader>ñ", ">>", { noremap = true, silent = false })
map("v", "ñ", "<<", { noremap = true, silent = false })

map("n", "t", "%", { noremap = true, silent = false })
map("v", "t", "%", { noremap = true, silent = false })

map("n", "m", "#", { noremap = true, silent = false })
map("v", "m", "#", { noremap = true, silent = false })

map("n", "<C-Space>", ":", { noremap = true, silent = false })

map(
    "n",
    "<C-u>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
    { noremap = true, silent = true }
)
map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", { noremap = true, silent = true })

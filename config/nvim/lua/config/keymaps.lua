local opts = { noremap = true, silent = true }
local fopts = { noremap = false, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- *** user key ***
keymap('n', '<C-s>', '<cmd>w<CR>', opts)
keymap('n', '<leader>x', '<cmd>bd<CR>', fopts)
keymap('n', '<leader>Q', '<cmd>w<CR><cmd>q<CR>')
keymap('i', 'jk', '<ESC>', opts)
keymap('n', 'J', '}', opts)
keymap('n', 'K', '{', opts)
keymap('n', '<leader>j', 'J', opts)
keymap('v', '<leader>j', 'J', opts)
keymap('n', '<C-Space>', ':', { desc = 'modo comando' })
keymap('n', '<A-0>', 'd$', opts)
keymap('n', 'v', 'V', opts)
keymap('n', '<C-A-k>', '<cmd> resize +2<CR>')
keymap('n', '<C-A-j>', '<cmd> resize -2<CR>')
keymap('n', '<C-A-l>', '<cmd> vertical resize -2<CR>')
keymap('n', '<C-A-h>', '<cmd> vertical resize +2<CR>')
keymap({ 'n', 't' }, '<C-Left>', '<C-w>h', opts)
keymap({ 'n', 't' }, '<C-Down>', '<C-w>j', opts)
keymap({ 'n', 't' }, '<C-Up>', '<C-w>k', opts)
keymap({ 'n', 't' }, '<C-Right>', '<C-w>l', opts)
keymap('n', 't', '%', opts, { desc = 'pasar a la siguiente pestaña' })
keymap('v', 't', '%', opts, { desc = 'pasar a la siguiente pestaña' })
-- *** comments plugins key ***
keymap('n', '<leader>cl', 'gcc', { desc = '(comments-nvim) comentar linea', remap = true })
keymap('v', '<leader>c', 'gc', { desc = '(comments-nvim) comentar bloque', remap = true })
-- ui.bufferline
keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', opts, { desc = '(bufferL) pasar a la siguiente pestaña' })
keymap('n', '<A-n>', ':BufferLineMovePrev<CR>', opts, { desc = '(bufferL) mover la pestaña hacia la izq' })
keymap('n', '<A-m>', ':BufferLineMoveNext<CR>', opts, { desc = '(bufferL) mover la pestaña hacia la der' })
keymap('n', '<A-p>', ':BufferLineTogglePin<CR>', opts, { desc = '(bufferL) pin pestaña' })
-- telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts, { desc = '(telescope) buscar archivos' })
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts, { desc = '(telescope) buscar coincidencias' })
keymap('n', '<leader>fm', ':TodoTelescope<CR>', opts, { desc = '(telescope) buscar todos-comments' })
keymap('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
keymap('n', '<leader>fn', '<Cmd>Telescope notify<CR>', opts)
-- nvimtree
keymap('n', '<A-n>', '<cmd>NvimTreeToggle<CR>', { desc = '(nvimtree) abrir tree' })
vim.keymap.set('n', '<leader>e', function()
  if vim.fn.bufname():match('NvimTree_') then
    vim.cmd.wincmd('p')
  else
    vim.cmd('NvimTreeFindFile')
  end
end, { desc = 'nvim-tree: toggle' })

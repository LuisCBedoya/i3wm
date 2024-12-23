require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'javascript',
    'typescript',
    'json',
    'bash',
    'html',
    'css',
    'java',
    'markdown',
    'xml',
    'http',
    'graphql',
  },

  auto_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
    disable = { '' },
  },
  indent = {
    enable = true,
    -- disable = { 'http' },
  },
  autopairs = {
    enable = true,
  },
})

require('ts_context_commentstring').setup({
  enable = true,
  enable_autocmd = false,
})

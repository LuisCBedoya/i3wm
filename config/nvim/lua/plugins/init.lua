local icons = require('plugins.ui.icons')
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- *** ui ***
    {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('plugins.ui.treesitter')
    end,
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  {
    'nvim-tree/nvim-web-devicons',
    opts = function()
      return { override = require('plugins.ui.devicons') }
    end,
    config = function(_, opts)
      require('nvim-web-devicons').setup(opts)
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('plugins.ui.autopairs')
    end,
  },
  { 'hiphish/rainbow-delimiters.nvim' },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.ui.indent-blankline')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'BufWinEnter',
    config = function()
      require('plugins.ui.lualine')
    end,
  },
  {
    'famiu/bufdelete.nvim',
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.ui.bufferline')
    end,
    -- event = 'User FileOpened',
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins.ui.telescope')
    end,
  },
  { 'nvim-lua/plenary.nvim' },
    {
    'Mofiqul/vscode.nvim',
    name = 'vscode',
    lazy = false,
    priority = 1000,
    config = function()
      require('plugins.ui.vscode-theme')
    end,
  },

  -- tools
    {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function()
      require('plugins.ui.tree')
    end,
  },
}

local opts = {
  ui = {
    icons = {
      ft = icons.lazy.Ft,
      lazy = icons.lazy.Lazy,
      loaded = icons.lazy.Loaded,
      not_loaded = icons.lazy.Not_loaded,
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
        'tutor',
        'rplugin',
        'syntax',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
      },
    },
  },
}

require('lazy').setup(plugins, opts)

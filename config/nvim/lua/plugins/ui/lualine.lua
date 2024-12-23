local icons = require('plugins.ui.icons')
local utils = require('plugins.ui.utils')

require('lualine').setup({
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha' },
  },
  sections = {
    lualine_a = {
      {
        -- Colored mode icon
        function()
          return icons.ui.Target
        end,
        color = function()
          return { fg = '#000000', bg = utils.mode_colors[vim.fn.mode()] }
        end,
        separator = { left = '', right = '' },
        -- separator = { left = '', right = '' },
        padding = { left = 1, right = 1 },
      },
    },
    lualine_b = {},
    lualine_c = {
      {
        -- File type icon via 'nvim-web-devicons'
        function()
          if utils.has_devicons then
            return utils.get_ftype_icon()
          end
        end,
        cond = utils.condition.is_buf_empty,
        color = { fg = utils.static.ftype_icon_color },
        padding = { left = 1, right = 0 },
      },
      {
        'filename',
        cond = utils.condition.is_buf_empty,
        path = 0,
        symbols = {
          modified = icons.git.Unstaged,
          readonly = icons.ui.Lock,
          unnamed = '[No Name]',
          newfile = '[New]',
        },
      },
      {
        'diagnostics',
        sources = { 'nvim_lsp', 'nvim_diagnostic' },
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warning,
          info = icons.diagnostics.Information,
          hint = icons.diagnostics.Hint,
        },
        diagnostics_color = {
          error = { fg = '#ea7676' },
          warn = { fg = '#eac276' },
          info = { fg = '#017bcd' },
          hint = { fg = '#017bcd' },
        },
        {
          function()
            return '%='
          end,
        },
      },
    },
    lualine_x = {
      {
        utils.clients_lsp,
      },
      {
        'diff',
        cond = utils.condition.is_git_repo,
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
          end
        end,
        symbols = {
          added = icons.git.Add,
          modified = icons.git.Mod,
          removed = icons.git.Remove,
        },
        colored = true,
        diff_color = {
          added = { fg = '#54bc5c' },
          modified = { fg = '#017bcd' },
          removed = { fg = '#df4b4b' },
        },
      },
      { 'branch', icon = icons.git.Branch },
      {
        function()
          return ' █'
        end,
        color = function()
          return { fg = utils.mode_colors[vim.fn.mode()] }
        end,
        padding = { right = 0 },
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  extensions = { 'toggleterm', 'trouble' },
})

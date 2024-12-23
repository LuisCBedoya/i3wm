local icons = require('plugins.ui.icons')

require('nvim-tree').setup({
  experimental = {},
  auto_reload_on_write = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort = {
    sorter = 'name',
    folders_first = true,
    files_first = false,
  },
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = 'default',
  select_prompts = false,
  view = {
    adaptive_size = false,
    centralize_selection = true,
    width = 33,
    cursorline = true,
    debounce_delay = 15,
    side = 'left',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = 'editor',
        border = 'rounded',
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = 'name',
    highlight_opened_files = 'none',
    root_folder_label = ':t',
    full_name = false,
    indent_width = 2,
    special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
    symlink_destination = true,
    highlight_diagnostics = 'none',
    highlight_modified = 'none',
    highlight_bookmarks = 'none',
    highlight_clipboard = 'name',
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = '└',
        edge = '│',
        item = '│',
        bottom = '─',
        none = ' ',
      },
    },
    icons = {
      webdev_colors = true,

      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = false,
          color = true,
        },
      },
      git_placement = 'before',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      modified_placement = 'after',
      diagnostics_placement = 'signcolumn',
      bookmarks_placement = 'signcolumn',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
        diagnostics = true,
        bookmarks = true,
      },
      glyphs = {
        default = icons.ui.Location,
        symlink = icons.documents.FolderSymlink,
        bookmark = icons.ui.BookMark,
        modified = icons.ui.Circle,
        folder = {
          arrow_closed = icons.ui.TriangleShortArrowRight,
          arrow_open = icons.ui.TriangleShortArrowDown,
          default = icons.documents.Folder,
          open = icons.documents.OpenFolder,
          empty = icons.documents.EmptyFolder,
          empty_open = icons.documents.EmptyFolderOpen,
          symlink = icons.documents.Symlink,
          symlink_open = icons.documents.FolderSymlinkOpen,
        },
        git = {
          unstaged = icons.git.Unstaged,
          staged = icons.git.Staged,
          unmerged = icons.git.Unmerged,
          renamed = icons.git.Rename,
          untracked = icons.git.Untracked,
          deleted = icons.git.Remove,
          ignored = icons.git.Ignore,
        },
      },
    },
  },
  hijack_directories = {
    enable = false,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = {},
    },
    exclude = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    },
  },
  filters = {
    enable = true,
    dotfiles = false,
    git_clean = false,
    git_ignored = false,
    no_bookmark = false,
    no_buffer = false,
    custom = { 'node_modules', '\\.cache' },
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 400,
    cygwin_support = false,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = 'cursor',
        border = 'shadow',
        style = 'minimal',
      },
    },
    open_file = {
      quit_on_open = true,
      eject = true,
      resize_window = false,
      window_picker = {
        enable = true,
        picker = 'default',
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'lazy', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = 'gio trash',
  },
  live_filter = {
    prefix = '[FILTER]: ',
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
    absolute_path = true,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
      default_yes = false,
    },
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  help = {
    sort_by = 'key',
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  system_open = {
    cmd = nil,
    args = {},
  },
})

vim.o.confirm = true
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('NvimTreeClose', { clear = true }),
  callback = function()
    local layout = vim.api.nvim_call_function('winlayout', {})
    if
      layout[1] == 'leaf'
      and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), 'filetype') == 'NvimTree'
      and layout[3] == nil
    then
      vim.cmd('quit')
    end
  end,
})

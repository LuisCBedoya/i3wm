local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
local static = {}

local get_ftype_icon = function()
  local full_filename = vim.api.nvim_buf_get_name(0)
  local filename = vim.fn.fnamemodify(full_filename, ':t')
  local extension = vim.fn.fnamemodify(filename, ':e')
  static.ftype_icon, static.ftype_icon_color = devicons.get_icon_color(filename, extension, { default = true })
  return static.ftype_icon and static.ftype_icon .. ''
end

local condition = {
  -- is_buf_empty = function()
  --   return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  -- end,
  is_git_repo = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local clients_lsp = function()
  local bufnr = vim.api.nvim_get_current_buf()

  local clients = vim.lsp.buf_get_clients(bufnr) -- Don't change, breaks the function
  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  -- return table.concat(c, ' | ')
  return '[' .. table.concat(c, ' | ') .. ']'
end

local mode_colors = {
  n = '#017bcd',
  no = '#017bcd',
  cv = '#017bcd',
  ce = '#017bcd',
  -- ['!'] = ,
  t = '#54bc5c',
  i = '#54bc5c',
  v = '#eac276',
  [''] = '#df973d',
  V = '#df973d',
  -- c = ,
  -- s = ,
  -- S = ,
  -- [''] = ,
  -- ic = ,
  -- R = ,
  -- Rv = ,
  -- r = ,
  -- rm = ,
  -- ['r?'] = ,
}

return {
  has_devicons = has_devicons,
  devicons = devicons,
  static = static,
  get_ftype_icon = get_ftype_icon,
  condition = condition,
  clients_lsp = clients_lsp,
  mode_colors = mode_colors,
}

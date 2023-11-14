require('neoscroll').setup({
  -- Set any options as needed
})
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = { 'scroll', { '-0.20', 'true', '100' } }
t['<C-d>'] = { 'scroll', { '0.20', 'true', '100' } }

require('neoscroll.config').set_mappings(t)

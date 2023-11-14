require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

-- Give me rounded borders everywhere
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--Enable (broadcasting) snippet capability for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- lua-language-server -----------------------------------------------------------------------------------------------

local root_path = '/home/luc/.local/share/nvim/language-servers/lua-language-server'
local binary = '/home/luc/.local/share/nvim/language-servers/lua-language-server/bin/lua-language-server'

-- language-servers for lua
require('lspconfig').lua_ls.setup({
  cmd = { binary, '-E', root_path .. '/main.lua' },
  -- capabilities
  capabilities = capabilities,
  -- on_attach
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,

  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
      completion = { callSnippet = 'Both' },
    },
  },
})

-- language-servers for css
require('lspconfig').cssls.setup({
  capabilities = capabilities,
  settings = {
    scss = {
      lint = {
        idSelector = 'warning',
        zeroUnits = 'warning',
        duplicateProperties = 'warning',
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true,
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

-- language-servers for js
require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

-- language-servers for html
require('lspconfig').emmet_ls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  filetypes = {
    'css',
    'eruby',
    'html',
    'javascript',
    'javascriptreact',
    'less',
    'sass',
    'scss',
    'svelte',
    'pug',
    'typescriptreact',
    'vue',
  },
  init_options = {
    html = {
      options = {
        ['bem.enabled'] = true,
      },
    },
  },
})

-- language server for php
require('lspconfig').intelephense.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

-- language server for python
require('lspconfig').pyright.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
})

-- language server for java
-- require('lspconfig').jdtls.setup({
--   capabilities = capabilities,
--   on_attach = function(client)
--     client.server_capabilities.document_formatting = false
--   end,
--     settings = {
--       java = {
--         format = {
--           settings = { url = '/path/to/local/settings.xml' },
--         },
--       },
--     },
-- })

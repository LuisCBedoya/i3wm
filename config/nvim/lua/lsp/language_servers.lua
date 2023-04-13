require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

--Enable (broadcasting) snippet capability for completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lua-language-server -----------------------------------------------------------------------------------------------
local root_path = "/home/luc/.local/share/nvim/language_servers/lua-language-server"
local binary = "/home/luc/.local/share/nvim/language_servers/lua-language-server/bin/lua-language-server"

require("lspconfig").lua_ls.setup({
  cmd = { binary, "-E", root_path .. "/main.lua" },
  -- capabilities
  capabilities = capabilities,
  -- on_attach
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,

  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
-- -----------------------------------------------------------------------------------------------------------------------------
-- other server

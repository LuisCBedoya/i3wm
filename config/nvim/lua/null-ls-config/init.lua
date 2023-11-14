local null_ls = require('null-ls')

local lSsources = {
  null_ls.builtins.formatting.prettier.with({
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('/home/luc/.config/nvim/formatter-config/.prettierrc.json'),
    },
  }),
  null_ls.builtins.formatting.stylua.with({
    -- env = {
    -- 	STYLUA_DEFAULT_CONFIG = vim.fn.expand("/home/luc/.config/nvim/formatter-config/.stylua.toml"),
    -- },
    extra_args = { '--config-path', vim.fn.expand('/home/luc/.config/nvim/formatter-config/.stylua.toml') },
    -- args = { "--indent-width", "4", "--indent-type", "Spaces", "-" },
  }),
  null_ls.builtins.formatting.black.with({
    filetypes = {
      'python',
    },
    args = { '--stdin-filename', '$FILENAME', '--quiet', '-' },
  }),
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
require('null-ls').setup({
  -- root_dir = require("null-ls.utils").root_pattern(".git", "package.json"),
  sources = lSsources,
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      -- vim.cmd([[
      --       augroup document_highlight
      --       autocmd! * <buffer>
      --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      --       augroup END
      --     ]])
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name == 'null-ls'
            end,
          })
        end,
      })
    end
  end,
})

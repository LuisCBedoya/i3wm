local null_ls = require("null-ls")
local lSsources = {
    null_ls.builtins.formatting.prettier.with({
        cli_options = {
            arrow_parens = "always",
            bracket_spacing = true,
            bracket_same_line = false,
            embedded_language_formatting = "auto",
            end_of_line = "lf",
            html_whitespace_sensitivity = "css",
            -- jsx_bracket_same_line = false,
            jsx_single_quote = false,
            print_width = 80,
            prose_wrap = "preserve",
            quote_props = "as-needed",
            semi = true,
            single_attribute_per_line = false,
            single_quote = false,
            tab_width = 4,
            trailing_comma = "es5",
            use_tabs = false,
            vue_indent_script_and_style = false,
        },
        filetypes = {
            "javascript",
            "typescript",
            "css",
            "scss",
            "html",
            "json",
            "markdown",
            "md",
            "txt",
        },
    }),
    null_ls.builtins.formatting.stylua.with({
        filetypes = {
            "lua",
        },
        args = { "--indent-width", "4", "--indent-type", "Spaces", "-" },
    }),
    -- null_ls.builtins.diagnostics.stylelint.with({
    --     filetypes = {
    --         "css",
    --         "scss",
    --     },
    -- }),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- root_dir = require("null-ls.utils").root_pattern(".git", "package.json"),
    sources = lSsources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(client)
                            return client.name == "null-ls"
                        end,
                    })
                end,
            })
        end
    end,
})

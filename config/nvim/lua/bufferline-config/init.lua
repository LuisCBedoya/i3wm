vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
        mode = "buffers",
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = false,
            },
        },
    },
})

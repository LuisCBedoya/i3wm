local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local Terminal = require("toggleterm.terminal").Terminal

local toggle_float = function()
    local float = Terminal:new({ direction = "float" })
    return float:toggle()
end
local toggle_lazygit = function()
    local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
    return lazygit:toggle()
end

-- ---------------------------------------
local mappings = {
    q = { ":q<cr>", "Quit" },
    Q = { ":wq<cr>", "Save & Quit" },
    w = { ":w<cr>", "Save" },
    x = { ":bdelete<cr>", "Close" },
    f = { ":Telescope find_files<cr>", "Telescope Find Files" },
    r = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
    t = {
        name = "Terminal",
        t = { ":ToggleTerm<cr>", "Split Below" },
        f = { toggle_float, "Floating Terminal" },
        l = { toggle_lazygit, "LazyGit" },
    },
    l = {
        name = "LSP",
        i = { ":LspInfo<cr>", "Connected Language Servers" },
        k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
        w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
        W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
        l = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            "List Workspace Folders",
        },
    },
    z = {
        name = "Focus",
        z = { ":ZenMode<cr>", "Toggle Zen Mode" },
        t = { ":Twilight<cr>", "Toggle Twilight" },
    },
    p = {
        name = "Packer",
        r = { ":PackerClean<cr>", "Remove Unused Plugins" },
        c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
        i = { ":PackerInstall<cr>", "Install Plugins" },
        p = { ":PackerProfile<cr>", "Packer Profile" },
        s = { ":PackerSync<cr>", "Sync Plugins" },
        S = { ":PackerStatus<cr>", "Packer Status" },
        u = { ":PackerUpdate<cr>", "Update Plugins" },
    },
    n = {
        name = "null-ls",
        l = { ":NullLsLog<cr>", "Nulls Log" },
        i = { ":NullLsInfo<cr>", "Nulls Info" },
    },
}
local opts = { prefix = "<leader>" }
wk.register(mappings, opts)

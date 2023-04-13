local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.api.nvim_command("packadd packer.nvim")
end

return require("packer").startup({
  function(use)
    -- ----------------------------------------------------------------------------------------------------------------------
    -- packer plugin manager
    use({ "wbthomason/packer.nvim" })
    -- theme nightfox
    use("EdenEast/nightfox.nvim")
    -- a statusline
    use({ "nvim-lualine/lualine.nvim" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", tag = "v3.*" })
    -- file explorer
    use({ "nvim-tree/nvim-tree.lua" })
    -- Find, Filter, Preview, Pick. All lua, all the time.
    use({ "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = { { "nvim-lua/plenary.nvim" } } })

    -- treesitter and modules -----------------------------------------------------
    -- file explorer
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "p00f/nvim-ts-rainbow" })
    --> autopairs
    use({ "windwp/nvim-autopairs" })
    -- autotag
    use({ "windwp/nvim-ts-autotag" })
    -- comments
    use({ "terrortylor/nvim-comment" })
    -- indent guides for neovim
    use({ "lukas-reineke/indent-blankline.nvim" })
    -- nvim-colorizer
    use({ "norcalli/nvim-colorizer.lua" })
    --   ----------------------------------------------------------------------------

    -- keybindings in popup
    use({ "folke/which-key.nvim" })
    -- enable icons
    use({ "nvim-tree/nvim-web-devicons" })

    -- nvim-cmp - A completion engine plugin for neovim written in Lua. -----------------------------
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer" })
    use({ "hrsh7th/cmp-path" })
    use({ "hrsh7th/cmp-cmdline" })
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-vsnip" })

    --  snippet
    use({ "hrsh7th/vim-vsnip" })
    use({ "hrsh7th/vim-vsnip-integ" })
    -- ----------------------------------------------------------------------------------------------
    -- git info
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup({ current_line_blame = true })
      end,
    })
    -- toggleterm
    use({
      "akinsho/toggleterm.nvim",
      tag = "*",
      config = function()
        require("toggleterm").setup()
      end,
    })
    -- Mason installer
    use({ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" })
    -- format null-ls
    use({ "jose-elias-alvarez/null-ls.nvim", config = "require('null-ls-config')" })
    -- zen-mode
    use({ "folke/zen-mode.nvim", config = "require('zen-mode-config')" })
    -- twilight focus mode
    -- use {"folke/twilight.nvim",config = "require('twilight-config')"}
  end,
  -- --------------------------------------------------------------------------------------------------------------------------------------
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

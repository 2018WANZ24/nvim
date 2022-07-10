local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
  },
}

return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim" -- Speed up loading Lua modules    TODO: figure out how to use this
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "rcarriga/nvim-notify"
  use "kyazdani42/nvim-web-devicons"

  -- Telescope
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use "nvim-telescope/telescope.nvim"
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-dap.nvim"
  use "nvim-telescope/telescope-project.nvim"

  -- Treesittetr
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "romgrk/nvim-treesitter-context"
  use "p00f/nvim-ts-rainbow"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "kosayoda/nvim-lightbulb"
  use "ray-x/lsp_signature.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  use "ethanholz/nvim-lastplace"
  use "tpope/vim-surround"

  use "ahmedkhalf/project.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "folke/which-key.nvim"
  use "phaazon/hop.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Debugger
  use "ravenxrz/DAPInstall.nvim"
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use { "jbyuki/one-small-step-for-vimkind", module = "osv" } -- debug any Lua code running in a Neovim instance
  use {
    "sakhnik/nvim-gdb",
    run = "./install.sh"
  }

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"
  use "kdheepak/lazygit.nvim"

  -- UI
  -- Colorschemes
  use "lunarvim/colorschemes"
  use "rakr/vim-one"
  use "theniceboy/nvim-deus"
  use "projekt0n/github-nvim-theme"

  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"
  use "kevinhwang91/nvim-bqf"
  use "folke/todo-comments.nvim"
  use "simrat39/symbols-outline.nvim"
  use "norcalli/nvim-colorizer.lua"
  use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  }
  use "j-hui/fidget.nvim"
  -- litee family
  use "ldelossa/litee.nvim"
  use "ldelossa/litee-calltree.nvim"

  -- tools
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "Shatur/neovim-session-manager"
  use "Shatur/neovim-cmake"
  -- use {
  --   "skanehira/preview-markdown.vim",
  --   opt = true,
  --   cmd = "PreviewMarkdown",
  -- }
  use {
    "npxbr/glow.nvim",
    ft = { "markdown" }
  }
  use "voldikss/vim-translator"
  use "mtdl9/vim-log-highlighting"
  use "Pocco81/HighStr.nvim"
  use "vim-test/vim-test"
  use {
    "rcarriga/vim-ultest",
    run = ":UpdateRemotePlugins"
  }
  use { 'michaelb/sniprun', run = 'bash ./install.sh' }
  use "Pocco81/AutoSave.nvim"
  use "djoshea/vim-autoread"
  use 'mg979/vim-visual-multi'
  use 'gcmt/wildfire.vim'
  use 'mbbill/undotree'
  use "kevinhwang91/rnvimr"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

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
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- General Packaging and Lua Helpers
  use "wbthomason/packer.nvim"   -- Have packer manage itself
  use "nvim-lua/plenary.nvim"    -- Useful lua functions used by lots of plugins
  -- use "lewis6991/impatient.nvim" -- speed up lua loading times

  -- Text Editing
  use "windwp/nvim-autopairs"    -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"    -- Easily comment stuff

  -- Aesthetics and Theming
  use "kyazdani42/nvim-web-devicons"        -- Font Icons
  use "lukas-reineke/indent-blankline.nvim" -- Indent guides
  use "lunarvim/colorschemes"               -- Multiple colorschemes to try out
  use "ellisonleao/gruvbox.nvim"            -- Colorscheme
  use "lunarvim/darkplus.nvim"              -- Colorscheme

  -- UI/UX
  use "goolord/alpha-nvim"         -- Startpage
  use "nvim-lualine/lualine.nvim"  -- Statusline
  use { "akinsho/bufferline.nvim", requires = 'kyazdani42/nvim-web-devicons' }
  use "moll/vim-bbye"              -- Delete buffers without closing windows/messing up layout
  use {"kyazdani42/nvim-tree.lua", requires = 'kyazdani42/nvim-web-devicons' }
  -- use "akinsho/toggleterm.nvim" -- TODO: unchecked
  use "ahmedkhalf/project.nvim"    -- TODO: turn off setting that goes to project dir automatically
  -- use "folke/which-key.nvim"       -- TODO: unchecked

  -- Completions (Powered by nvim-cmp) TODO: figure out how to use tab to selection options in '/' search menu
  use "hrsh7th/nvim-cmp"         -- The completion plugin; TODO: figure out how to trigger with key so backspace doesn't need to auto-trigger
  use "hrsh7th/cmp-buffer"       -- buffer completions
  use "hrsh7th/cmp-path"         -- path completions
  use "hrsh7th/cmp-cmdline"      -- cmdline completions; TODO: fix overlap with default cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"     -- completions from lsp options
  use "hrsh7th/cmp-nvim-lua"     -- completions for nvim lua config files
  use "uga-rosa/cmp-dictionary"  -- dictionary completions

  -- Snippets
  use "L3MON4D3/LuaSnip"             -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig"           -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use "RRethy/vim-illuminate"           -- highlight other uses of word under cursor
  use "b0o/SchemaStore.nvim"            -- JSON schemas; TODO: see if this is actually useful










  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- use "tom-anders/telescope-vim-bookmarks.nvim" -- search through vim code bookmarks
  -- use "lalitmee/browse.nvim" -- special additional browsers

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring" -- comment recognition for embedded languages
  use "p00f/nvim-ts-rainbow"                        -- rainbow-colored parentheses

  -- Git
  use "lewis6991/gitsigns.nvim" -- git decorations

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.4' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use {
    "nvim-telescope/telescope-frecency.nvim"
  }
  use 'nanotech/jellybeans.vim'
  use 'tyru/open-browser.vim'
  use 'tyru/open-browser-github.vim'
  use 'mattn/vim-goimports'
  use 'vim-test/vim-test'
  use 'mattn/emmet-vim'
  use 'othree/eregex.vim'
  use 'fuenor/qfixhowm'
  use 'nathanaelkane/vim-indent-guides'
  use 'tpope/vim-speeddating'
  use 'tomtom/tcomment_vim'
  use 'Lokaltog/vim-easymotion'
  use 'previm/previm'
  use 'vim-scripts/surround.vim'
  use 'vim-scripts/sudo.vim'
  use 'vim-scripts/renamer.vim'
  use 'vim-scripts/matchit.zip'
  use 'vim-scripts/camelcasemotion'
  use 'Townk/vim-autoclose'
  use 'h1mesuke/vim-alignta'
  use 'itchyny/lightline.vim'
  use 'AndrewRadev/switch.vim'
  use 'sebdah/vim-delve'
end)

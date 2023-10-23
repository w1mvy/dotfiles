-- telescope
require("telescope").setup {
  pickers = {
    git_files = {
      git_command = {'git', 'ls-files', '--exclude-standard', '--cached', '--others',},
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension("frecency")

vim.api.nvim_set_keymap('n', '[t]', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>u', '[t]', { noremap = false })
vim.api.nvim_set_keymap('n', '[t]b', ':<C-u>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]f', ':<C-u>Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]m', ':<C-u>Telescope frecency<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]ld', ':<C-u>Telescope lsp_definitions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]li', ':<C-u>Telescope lsp_implementations<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]lr', ':<C-u>Telescope lsp_references<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]lt', ':<C-u>Telescope lsp_type_definitions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]g', ':<C-u>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[t]la', ':<C-u>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  group = 'DoWritePre',
  command = [[:lua vim.lsp.buf.format()]],
})

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'lua', 'vim', 'vimdoc', 'hcl', 'python', 'markdown', 'sql', 'bash', 'json', 'yaml' },
  highlight = {
    enable = true,
    disable = {},
  },
}

-- qfixhowm
vim.g.QFixHowm_Key = 'g'
vim.g.howm_dir='~/tmp/howm'
vim.g.homm_fileencoding='utf-8'
vim.g.hown_fileformat='unix'
vim.g.howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
vim.g.QFixHowm_FileType = 'markdown'
vim.g.QFixHowm_Title = '#'

-- vim-indent-guides
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_color_change_percent = 30
vim.g.indent_guides_guide_size = 1

-- vim-easymotion
vim.g.EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
vim.g.EasyMotion_leader_key="'"
vim.g.EasyMotion_grouping=1


-- vim-goimports
vim.g.goimports_simplify = 1

-- cursorline
-- cursorline setting
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

-- vim-vsnip
vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function(ev)
        vim.keymap.set({'i', 's'}, '<C-j>', function() return vim.fn['vsnip#available'](1) == 1 and '<Plug>(vsnip-expand-or-jump)' or '<C-l>' end, { expr = true, noremap = false })
        vim.keymap.set({'i', 's'}, '<Tab>', function() return vim.fn['vsnip#jumpable'](1) == 1 and '<Plug>(vsnip-jump-next)' or '<Tab>' end, { expr = true, noremap = false })
        vim.keymap.set({'i', 's'}, '<S-Tab>', function() return vim.fn['vsnip#jumpable'](-1) == 1 and '<Plug>(vsnip-jump-prev)' or '<S-Tab>' end, { expr = true, noremap = false })
        vim.keymap.set({'n', 's'}, '<s>', [[<Plug>(vsnip-select-text)]], { expr = true, noremap = false })
        vim.keymap.set({'n', 's'}, '<S>', [[<Plug>(vsnip-cut-text)]], { expr = true, noremap = false })
    end,
})
-- vim.g.vsnip_filetypes = {
--     go = { "go" }
-- }

require("ibl").setup()
require('gitsigns').setup()
require("nvim-surround").setup()
require("nvim-autopairs").setup()

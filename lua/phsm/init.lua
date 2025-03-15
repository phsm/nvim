vim.g.mapleader = " "

vim.opt.termguicolors = true


-- Soft tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- scroll a bit extra horizontally and vertically when at the end/bottom
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- Show non-printed chars
vim.opt.list = true
vim.opt.listchars = {
  -- eol = "↲",
  tab = "▸ ",
  trail = "·",
}

require("phsm.lazy_init")
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "go", "python", "markdown", "markdown_inline" },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  }
}

require("mason").setup {
  ensure_installed = { "lua_ls", "gopls" },
}
require("mason-lspconfig").setup()

require('Comment').setup()

require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
  }
}


-- Find files, live grep
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Buffer navigation
vim.keymap.set("n", "<tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-tab>", ":bnext<CR>")

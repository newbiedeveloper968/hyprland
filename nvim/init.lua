-- ========================
--      BASIC SETTINGS
-- ========================

vim.opt.number = true                  -- Show absolute line numbers
vim.opt.relativenumber = true           -- Show relative line numbers
vim.opt.expandtab = true                -- Use spaces instead of tabs
vim.opt.shiftwidth = 4                  -- Indent width
vim.opt.tabstop = 4                     -- Tab character width
vim.opt.smartindent = true               -- Smarter autoindenting
vim.opt.termguicolors = true             -- Enable 24-bit RGB colors
vim.opt.cursorline = true                -- Highlight the line under cursor
vim.opt.clipboard = "unnamedplus"        -- Sync with system clipboard
vim.opt.mouse = "a"                      -- Enable mouse support
vim.opt.wrap = true                      -- Enable line wrapping
vim.opt.swapfile = false                 -- Disable swapfile

vim.opt.timeoutlen = 300                 -- Timeout for key sequences

vim.g.mapleader = " "                    -- Leader key set to space

-- ========================
--       PLUGINS
-- ========================

vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Mofiqul/vscode.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'preservim/nerdtree'              " File explorer
Plug 'nvim-telescope/telescope.nvim', {'do': ':UpdateRemotePlugins'} " Fuzzy finder
Plug 'nvim-lua/plenary.nvim'           " Required by telescope
Plug 'neovim/nvim-lspconfig'           " LSP configurations
Plug 'hrsh7th/nvim-cmp'                " Autocomplete plugin
Plug 'hrsh7th/cmp-nvim-lsp'            " LSP source for autocomplete
Plug 'hrsh7th/cmp-buffer'              " Buffer words source
Plug 'hrsh7th/cmp-path'                " Filesystem paths source
Plug 'hrsh7th/cmp-cmdline'             " Command-line completion
Plug 'L3MON4D3/LuaSnip'                " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'        " Snippet completions
Plug 'windwp/nvim-autopairs'           " Auto close pairs
Plug 'sainnhe/sonokai'

Plug 'jose-elias-alvarez/null-ls.nvim'

" Plug 'lervag/vimtex'
" Plug 'lervag/vimtex', { 'tag': 'v2.15' }

Plug 'nvim-lua/plenary.nvim'
Plug '3rd/image.nvim'

call plug#end()
]]

-- ========================
--     TELESCOPE SETUP
-- ========================

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = { ["<CR>"] = actions.select_vertical },
      n = { ["<CR>"] = actions.select_vertical },
    },
  },
}

-- ========================
--   CMP + AUTOPAIRS SETUP
-- ========================

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- ========================
--      KEYBINDINGS
-- ========================

vim.keymap.set("n", "<leader>cp", [[:let @+ = expand('%:p:h')<CR>]], { noremap = true, silent = true })

-- vim.cmd("colorscheme sonokai")
vim.cmd("colorscheme gruvbox")

vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("v", "y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "yy", '"+yy', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", ":NERDTreeFind<CR>", { noremap = true, silent = true })
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeWinSize = 20

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })

-- ========================
--     LSP CONFIGURATION
-- ========================

local lspconfig = require("lspconfig")
local servers = { "pyright", "clangd" }

local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
end

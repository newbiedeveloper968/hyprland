-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.wrap = false

vim.g.mapleader = " "

-- Plugins with vim-plug
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
Plug 'L3MON4D3/LuaSnip'                " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'        " Snippet completions

Plug 'windwp/nvim-autopairs'
Plug 'kevinhwang91/rnvimr'

call plug#end()
]]

-- nvim-autopairs
require('nvim-autopairs').setup{}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- rnvimr
vim.g.rnvimr_enable_ex = 1             -- enable :Rnvimr command
vim.g.rnvimr_enable_picker = 1         -- replace netrw with rnvimr
vim.g.rnvimr_draw_border = 1           -- add border around floating ranger
vim.g.rnvimr_hide_gitignore = 1        -- hide gitignored files
vim.g.rnvimr_ranger_cmd = { 'ranger' }
vim.g.rnvimr_edit_cmd = 'drop'
vim.keymap.set("n", "<leader>r", ":RnvimrToggle<CR>", { noremap = true, silent = true })

-- copy path
vim.keymap.set("n", "<leader>cp", [[:let @+ = expand('%:p:h')<CR>]], { noremap = true, silent = true })

-- Colorscheme
-- vim.cmd("colorscheme vscode")
vim.cmd("colorscheme gruvbox")

-- Set timeoutlen to 300 milliseconds
vim.opt.timeoutlen = 300

-- Map 'kj' in insert mode to Escape (exit insert mode)
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })

-- Map 'y' in visual mode to yank to system clipboard
vim.keymap.set("v", "y", '"+y', { noremap = true, silent = true })

-- Map 'yy' in normal mode to yank the whole line to system clipboard
vim.keymap.set("n", "yy", '"+yy', { noremap = true, silent = true })


-- NERDTree toggle
vim.keymap.set("n", "<leader>e", ":NERDTreeFind<CR>", { noremap = true, silent = true })
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeWinSize = 20  -- or whatever width you prefer

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })

-- Setup LSP
local lspconfig = require("lspconfig")
local servers = { "pyright", "clangd" }

-- Setup completion
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
}

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  local keymap = vim.keymap.set
  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "K", vim.lsp.buf.hover, bufopts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  keymap("n", "gr", vim.lsp.buf.references, bufopts)
  keymap("n", "[d", vim.diagnostic.goto_prev, bufopts)
  keymap("n", "]d", vim.diagnostic.goto_next, bufopts)
  keymap("n", "<leader>f", vim.lsp.buf.format, bufopts)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
end

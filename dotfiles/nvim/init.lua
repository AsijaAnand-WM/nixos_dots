-- ========================= OPTIONS =========================

vim.g.mapleader = ' 'vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.showmode = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.numberwidth = 6
vim.opt.colorcolumn = '90'
vim.opt.undofile = true
vim.opt.breakindent = true
vim.o.cursorline = true
vim.o.scrolloff = 10

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.cmdheight = 0
vim.opt.laststatus = 3

vim.opt.shortmess:append("I")

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.winborder = "single"
vim.opt.background = "dark"

-- ========================= _EXTRA_ =========================

vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<leader>n', ':Oil<CR>')
vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>x', ':x<CR>')

--TreeSitter Config
vim.cmd('syntax off')
vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		if not pcall(vim.treesitter.start) then
			vim.cmd('syntax enable')
		end
	end,
})

--Yank HL
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.hl.on_yank()
	end
})



--Quick-Scope
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight QuickScopePrimary guifg=#afff5f gui=underline")
		vim.cmd("highlight QuickScopeSecondary guifg=#5fffff gui=underline")
	end,
})
-- ========================= PLUGINS =========================

vim.pack.add({
	'https://github.com/unblevable/quick-scope',
	'https://github.com/rktjmp/lush.nvim',
	'https://github.com/zenbones-theme/zenbones.nvim',
	'https://github.com/windwp/nvim-autopairs',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/nvim-lualine/lualine.nvim',
	'https://github.com/catgoose/nvim-colorizer.lua',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/karb94/neoscroll.nvim',
	'https://github.com/abecodes/tabout.nvim',
    'https://github.com/neovim/nvim-lspconfig';
    'https://github.com/lewis6991/gitsigns.nvim';
    'https://github.com/ibhagwan/fzf-lua';
    'https://github.com/sainnhe/gruvbox-material';
})

--ColorScheme
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

        -- vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none" })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#A855F7", bg = "none" })
        -- vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none" })
    end,
})

vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_better_performance = 1
vim.cmd.colorscheme('gruvbox-material')

require('nvim-autopairs').setup({})

require('lualine').setup({
	options = {
		theme = 'gruvbox-material',
		section_separators = '',
		component_separators = '',
	},
})

require('colorizer').setup({})
require('oil').setup({})
require('neoscroll').setup({})
require('tabout').setup({})
require('gitsigns').setup({})
require('fzf-lua').setup({})

-- ========================= __LSP__ =========================

vim.lsp.enable({'lua_ls', 'nixd', 'clangd'})
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

-- ========================= _COMP._ =========================

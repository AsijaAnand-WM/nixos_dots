-- ========================= OPTIONS =========================

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
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
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.winborder = "single"
vim.opt.background = "dark"

vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    extends = "›",
    precedes = "‹",
    nbsp = "␣",
}

-- ========================= _EXTRA_ =========================

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

local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
    gh('unblevable/quick-scope'),
    gh('windwp/nvim-autopairs'),
    -- gh('nvim-tree/nvim-web-devicons'), --
    gh('nvim-lualine/lualine.nvim'), --
    gh('catgoose/nvim-colorizer.lua'),
    -- gh('stevearc/oil.nvim'), --
    -- gh('karb94/neoscroll.nvim'), --
    gh('neovim/nvim-lspconfig');
    gh('lewis6991/gitsigns.nvim');
    -- gh('ibhagwan/fzf-lua'); --
    gh('sainnhe/gruvbox-material');
    gh('nvim-mini/mini.pick');
    -- gh('folke/todo-comments.nvim'); --
    gh('j-hui/fidget.nvim');
    gh('stevearc/quicker.nvim');
    gh('hat0uma/csvview.nvim');
    gh('nvim-mini/mini.ai');
    -- gh('nvim-mini/mini.splitjoin'); --
    gh('kylechui/nvim-surround');
    gh('godlygeek/tabular');

    'https://git.sr.ht/~whynothugo/lsp_lines.nvim';
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

        vim.api.nvim_set_hl(0, "LspInlayHint", {
            link = "Comment",
            italic = true,
        })

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
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
        lualine_x = {
            {
                function()
                    local reg = vim.fn.reg_recording()
                    return reg ~= "" and ("Recording @" .. reg) or ""
                end
            },
        },
    },
})

require('colorizer').setup({})
-- require('oil').setup({})
-- require('neoscroll').setup({})
require('gitsigns').setup({})
-- require('fzf-lua').setup({})
require('fidget').setup({})
require('mini.ai').setup({})
-- require('mini.splitjoin').setup({})
require('nvim-surround').setup({})
require('mini.pick').setup({})

require('csvview').setup({})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "csv",
    callback = function()
        vim.cmd('CsvViewEnable')
    end,
})

require("quicker").setup({
  keys = {
    {
      ">",
      function()
        require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
      end
    },
    {
      "<",
      function()
        require("quicker").collapse()
      end
    },
  },
})

-- require("todo-comments").setup({
--     signs = false,
-- })

require("lsp_lines").setup({})
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
    signs = true,
    underline = false,
    severity_sort = true,
    update_in_insert = false,
})

-- ========================= __LSP__ =========================

vim.lsp.enable({
    'lua_ls',
    'nixd',
    'clangd',
    'bashls',
    'cssls',
    'superhtml',
    'ts_ls',
    'svelte',
    'astro',
    'tailwindcss',
    'marksman',
    'gopls',
    'zls',
    'clojure_lsp',
    'tinymist',
    'wgsl_analyzer',
    'glsl_analyzer',
    'jsonls',
    'yamlls',
    'expert',
    'basedpyright',
    'rust_analyzer',
    'taplo',
})

vim.lsp.inlay_hint.enable(false)
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        }
    }
})

-- ========================= KEYMAPS =========================

vim.keymap.set('n', '<Esc>', ':noh<CR>')
vim.keymap.set('i', 'jk', '<Esc>')
-- vim.keymap.set('n', '<leader>n', ':Oil<CR>')
vim.keymap.set('n', '<leader>w', ':update<CR>')
vim.keymap.set('n', '<leader>x', ':x<CR>')
vim.keymap.set('n', '<leader>t', ':! tmux popup<CR>')
-- vim.keymap.set('n', '<leader>f', ':Ex<CR>')

vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>')

-- vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>') --
-- vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>') --
-- vim.keymap.set('n', '<leader>fc', ':FzfLua grep_cword<CR>') --
-- vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>') --
-- vim.keymap.set('n', '<leader>fo', ':FzfLua oldfiles<CR>') --
-- vim.keymap.set('n', '<leader>fd', ':FzfLua diagnostics_document<CR>')
-- vim.keymap.set('n', '<leader>fw', ':FzfLua diagnostics_workspace<CR>')
-- vim.keymap.set('n', '<leader>gd', ':FzfLua lsp_definitions<CR>')
-- vim.keymap.set('n', '<leader>gr', ':FzfLua lsp_references<CR>') --
-- vim.keymap.set('n', '<leader>gi', ':FzfLua lsp_implementations<CR>') --
-- vim.keymap.set('n', '<leader>fa', ':FzfLua lsp_code_actions<CR>') --
-- vim.keymap.set('n', '<leader>fm', ':FzfLua marks<CR>') --

vim.keymap.set('n', 'gd', 'vim.lsp.buf.definition')

vim.keymap.set("n", "<leader>q", function()
  require("quicker").toggle()
end)
vim.keymap.set("n", "<leader>l", function()
  require("quicker").toggle({ loclist = true })
end)

-- ========================= __END__ =========================

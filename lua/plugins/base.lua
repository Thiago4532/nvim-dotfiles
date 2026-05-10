local function from_module(name)
    return function() require('config.plugins.' .. name) end
end

return {
    -- Syntax Highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        config = from_module 'treesitter',
        build = ':TSUpdate'
    },

    'vim-jp/vim-cpp',
    'bfrg/vim-cpp-modern',
    'neovimhaskell/haskell-vim',
    'tikhomirov/vim-glsl',

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        config = from_module 'nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },

    -- Colorscheme
    'sainnhe/gruvbox-material',

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = from_module 'nvim-tree',
    },
    
    'windwp/nvim-autopairs',

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },

        config = from_module 'telescope',
    },

    {
        'tpope/vim-surround',

        init = function() vim.g.surround_no_insert_mappings = 1 end,
        keys = { 'ds', 'cs', 'cS', 'ys', 'yS',
            'ys', 'yS', 'yS', { 'S', mode = 'x'  }, { 'gS', mode = 'x' }
        }
    },

    {
        "stevearc/dressing.nvim",
    },

    'tpope/vim-repeat',

    'lambdalisue/suda.vim',

    { 'mbbill/undotree', config = function() vim.g.undotree_WindowLayout = 3 end },

    'famiu/bufdelete.nvim',

    -- 'Thiago4532/lsp-tree.nvim',
    'Thiago4532/header-guard.nvim',

    { 'ThePrimeagen/harpoon', config = from_module 'harpoon' },

    'jghauser/mkdir.nvim',

    -- {
    --     'stevearc/aerial.nvim',
    --     config = from_module 'aerial',
    --
    --     dependencies = 'nvim-treesitter/nvim-treesitter'
    -- },
      
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = from_module 'copilot',
    -- },

    {
        'Thiago4532/mdmath.nvim',
        dir = vim.fn.expand('~/GitHub/mdmath.nvim'),
        opts = function()
            local opts = {
                dynamic_scale = 0.8
            }
            if vim.loop.cwd() == vim.fn.expand('~/teste') then
                opts.filetypes = {}
            end
            return opts
        end
            -- filetypes = {},
            -- foreground = '#ff0000'
        -- config = false,
    },
}

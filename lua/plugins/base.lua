
-- when requiring the configuration (similiar to what all plugins do using a setup function

local function from_module(name)
    return function() require('config.plugins.' .. name) end
end

return {
    -- Syntax Highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        config = from_module 'treesitter',
        dependencies = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
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

    -- Statusline and bufferline
    {
        'hoob3rt/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',

        config = from_module 'statusline',
    },
    -- {
    --     'akinsho/bufferline.nvim',
    --     dependencies = 'nvim-tree/nvim-web-devicons',

    --     config = from_module 'bufferline',
    -- },

    -- Colorscheme
    'sainnhe/gruvbox-material',

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = 'nvim-tree/nvim-web-devicons',

        config = from_module 'nvim-tree',
    },

    -- {
    --     'stevearc/oil.nvim',
    --     opts = {},

    --     dependencies = 'nvim-tree/nvim-web-devicons',
    -- },
    
    'windwp/nvim-autopairs',

    {
        'b3nj5m1n/kommentary',

        config = function()
            return require('kommentary.config').configure_language("default", {
                prefer_single_line_comments = true,
            })
        end,
        keys = {
            { 'gc', mode = {'n', 'x'} },
            { 'gcc' }
        },
    },

    -- Fuzzy finding
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
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            hints = { enabled = false },
            provider = 'openai-o4-mini',
            gemini = {
                model = "gemini-2.5-pro-exp-03-25"
            },
            vendors = {
                ["openai-o4-mini"] = {
                    __inherited_from = "openai",
                    model = "o4-mini",
                },
            }
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    },

    {
        "stevearc/dressing.nvim",
        -- opts = {
        --     input = {
        --         win_options = {
        --             sidescrolloff = 10,
        --         }
        --     }
        -- }
    },

    -- Repeat commands using '.',
    'tpope/vim-repeat',
 
    -- {
    --     'vimwiki/vimwiki',

    --     init = from_module 'vimwiki',
    --     event = {
    --         'BufNewFile *.wiki,*.md,*.mkdn,*.mdwn,*.mdown,*.markdown,*.rmd,*.mw',
    --         'BufReadPre *.wiki,*.md,*.mkdn,*.mdwn,*.mdown,*.markdown,*.rmd,*.mw',
    --     }
    -- },

    'lambdalisue/suda.vim',

    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     config = function() require'ibl'.setup{} end
    -- },

    { 'mbbill/undotree', config = function() vim.g.undotree_WindowLayout = 3 end },

    'famiu/bufdelete.nvim',

    -- 'Thiago4532/lsp-tree.nvim',
    'Thiago4532/header-guard.nvim',

    { 'ThePrimeagen/harpoon', config = from_module 'harpoon' },

    'jghauser/mkdir.nvim',

    {
        'stevearc/aerial.nvim',
        config = from_module 'aerial',

        dependencies = 'nvim-treesitter/nvim-treesitter'
    },
    
    -- {
    --     'github/copilot.vim',
    --     -- cmd = { 'Copilot' },
    --     init = function()
    --         vim.g.copilot_enabled = true
    --         vim.g.copilot_filetypes = {
    --             ['AvanteInput'] = false
    --         }
    --     end
    -- },
    
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = from_module 'copilot',
    -- },


    -- {
    --     'xeluxee/competitest.nvim',
    --     dependencies = 'MunifTanjim/nui.nvim',
    --     config = from_module 'competitest',
    -- }

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

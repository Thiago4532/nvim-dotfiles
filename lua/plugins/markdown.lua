local vim = vim
local create_autocmd = vim.api.nvim_create_autocmd
local bmap = require'util'.bmap
local is_executable = require'util'.is_executable

local M = {}

-- plugin: markdown-preview.nvim
do
    local file_types = {'markdown'}

    local function setup()
        create_autocmd({'FileType'}, {
            pattern = file_types,
            callback = function()
                bmap('n', '<F9>', ':MarkdownPreview<CR>')
            end
        })
    end

    M[#M + 1] = {
        'iamcco/markdown-preview.nvim',
        enabled = is_executable'yarn',

        build = 'cd app && yarn install',
        init = function()
            vim.g.mkdp_filetypes = file_types
        end,
        config = setup,
        ft = file_types
    }
end

-- plugin: render-markdown.nvim
do
    local file_types = {'markdown', 'Avante'}
    -- local file_types = {'Avante'}
    
    local function setup(_, opts)
        create_autocmd({'FileType'}, {
            pattern = file_types,
            callback = function()
                bmap('n', '<space>rm', ':RenderMarkdown buf_toggle<CR>')
            end
        })

        return require'render-markdown'.setup {
            file_types = file_types
        }
    end
    
    M[#M + 1] = {
        'MeanderingProgrammer/render-markdown.nvim',
        config = setup,
        ft = file_types,
    }
end

-- plugin: markview.nvim
-- do
--     -- M[#M + 1] = {
--     --     "OXY2DEV/markview.nvim",
--     -- }
-- end

return M

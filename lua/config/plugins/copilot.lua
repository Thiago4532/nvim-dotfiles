local vim = vim

local is_loaded = false
local function setup()
    if is_loaded then
        return
    end
    require 'copilot'.setup {
        suggestion = {
            auto_trigger = true
        }
    }

    local suggestion = require 'copilot.suggestion'

    require'util'.map("i", '<Tab>', function()
        if suggestion.is_visible() then
            suggestion.accept()
        else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
    end)
    is_loaded = true
end

vim.api.nvim_create_user_command('CopilotSetup', function()
    setup()
end, { desc = 'Setup Copilot' })

local path = vim.fn.expand('%:p')
if path == '' then
    path = vim.uv.cwd()
end 
if not path:match('CP%-Problems') then
    setup()
end

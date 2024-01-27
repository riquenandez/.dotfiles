require("rice.remap")
require("rice.set")

local augroup = vim.api.nvim_create_augroup
local RiceGroup = augroup('rice', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local save_group = augroup('FormatOnSave', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- autocmd({"BufWritePre"}, {
--     group = save_group,
--     pattern = { "*.ts", "*.js", ".tsx", ".jsx" },
--     -- callback = function(ev)
--     --     -- local linenr = vim.api.nvim_win_get_cursor(0)[1]
--     --     local r,c = unpack(vim.api.nvim_win_get_cursor(0))
--     --     -- local curline = vim.api.nvim_buf_get_lines(0, linenr - 1, linenr, false)[1]
--     --     vim.api.nvim_command("%!eslint_d --stdin --fix-to-stdout --stdin-filename %")
--     --     local bufnr = vim.api.nvim_get_current_buf()
--     --     local opts = {buffer = bufnr, 'F', r, c}
--     --     vim.api.nvim_buf_set_mark(bufnr, 'F', r, c)
--     --     print(linenr, curline)
--
--     -- end,
--     command = "%!eslint_d --stdin --fix-to-stdout --stdin-filename %",
-- })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.copilot_node_command = "/usr/local/n/versions/node/16.15.0/bin/node"

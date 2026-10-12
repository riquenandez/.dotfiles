

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
})

vim.lsp.enable('ts_ls')

vim.lsp.config('rust_analyzer', {
  -- Server-specific settings. See `:help lsp-quickstart`
  settings = {
    ['rust-analyzer'] = {},
  },
})

vim.lsp.enable('rust-analyzer')

vim.lsp.enable('pyright')

-- lsp.ensure_installed({
-- 	'tsserver',
-- 	'rust_analyzer',
--     'gopls'
-- })


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs)
            vim.keymap.set(mode, rhs, lhs, {buffer = event.buf})
        end

        bufmap("n", "gd", '<cmd>lua vim.lsp.buf.definition()<cr>')
        bufmap("n", "vd", '<cmd>lua vim.diagnostic.open_float()<cr>')
        bufmap("n", "K", '<cmd>lua vim.lsp.buf.hover()<cr>')
        --- bufmap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        -- bufmap("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        -- bufmap("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        bufmap("n", "vrr", '<cmd>lua vim.lsp.buf.references()<cr>')
        bufmap("n", "vca", '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap("n", "vrn", '<cmd>lua vim.lsp.buf.rename()<cr>')
        bufmap("n", "gri", '<cmd>lua vim.lsp.buf.implementation()<cr>')
        bufmap("n", "gri", '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        bufmap("n", "gO", '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
        bufmap({'i', 's'}, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    end,

})

vim.diagnostic.config({
    virtual_text = true
})

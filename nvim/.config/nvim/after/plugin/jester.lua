--require('jester').setup({
--    cmd = "npm run -t '$result' -- $file"
--})

vim.keymap.set("n", "<leader>jt", function() require"jester".run({ cmd = "npm run test --spec $file -t '$result'"}) end)
vim.keymap.set("n", "<leader>jd", function() jester.debug() end)

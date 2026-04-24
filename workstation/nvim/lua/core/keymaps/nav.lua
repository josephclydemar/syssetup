-- move up/down a line of code
-- vim.cmd("nnoremap <A-Up> :m .-2<CR>==")
-- vim.cmd("nnoremap <A-Down> :m .+1<CR>==")

-- copy up/down a line of code
vim.cmd("nnoremap <C-A-Down> :t .<CR>")
vim.cmd("nnoremap <C-A-Up> :t .-1<CR>")

vim.cmd("nnoremap <C-Up> :t .-1<CR>")

vim.keymap.set("n", "<>", "<cmd>AerialToggle!<CR>", { desc = "Aerial code hopping" })

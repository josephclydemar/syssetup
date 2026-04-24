return {
  keymaps = function ()
   vim.cmd("nmap <C-n> :Neotree filesystem reveal toggle right<CR>")
   vim.cmd("nmap <C-m> :Neotree git_status reveal toggle right<CR>")
  end,
}

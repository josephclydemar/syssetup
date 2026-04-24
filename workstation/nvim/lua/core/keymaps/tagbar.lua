return {
  tagbar = function ()
    vim.keymap.set("n", "<leader>ss", "<cmd>TagbarToggle<CR>", { desc = "Tagbar code hopping" })
    vim.keymap.set("n", "<M-j>", "<cmd>TagbarJumpPrev<CR>")
    vim.keymap.set("n", "<M-k>", "<cmd>TagbarJumpNext<CR>")
  end
}

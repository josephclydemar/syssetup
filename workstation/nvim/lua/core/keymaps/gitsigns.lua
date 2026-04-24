return {
  keymaps = function()
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
    vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>")
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>")
    vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
  end
}

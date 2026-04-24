return {
  keymaps = function ()
    vim.keymap.set("n", "<M-u>", ":UndotreeToggle<CR>", { desc = "Undo Tree" })
  end
}

return {
  keymaps = function ()
    vim.keymap.set("n", "<M-n>", ":OilToggle<CR>", { desc = "Open parent directory" })
  end
}

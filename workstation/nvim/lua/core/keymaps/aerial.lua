return {
  aerial = function (bufnr)
    vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle!<CR>", { desc = "Aerial code hopping" })
    vim.keymap.set("n", "<M-[>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "<M-]>", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end
}


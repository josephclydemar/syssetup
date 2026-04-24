-- Add open buffers to argument list
vim.keymap.set("n", "<leader>xx", function ()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
      vim.cmd("argadd " .. vim.fn.bufname(buf))
    end
  end
end, { desc = "Add open buffers to argument list" })


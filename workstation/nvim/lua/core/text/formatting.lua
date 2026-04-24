for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  if hl.italic then
    hl.italic = false
    vim.api.nvim_set_hl(0, group, hl)
  end
end



require("core.lazy")

require("core.utils.user")
require("core.keymaps.windows")
require("core.keymaps.tabs")
require("core.keymaps.quicklist")
require("core.keymaps.nav")
require("core.keymaps.custom")
require("core.text.formatting")
require("core.colors.scheme")

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2 expandtab")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=2")
vim.cmd("set mouse=a")
vim.cmd("set scrolloff=14")
vim.cmd("set nowrap")
vim.cmd("set encoding=UTF-8")
vim.cmd("nmap <M-x> :nohlsearch<CR>")

require("live-server").setup({})



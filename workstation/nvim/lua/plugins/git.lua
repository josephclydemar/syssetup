return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
        -- current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
      })
      require("core.keymaps.gitsigns").keymaps()
		end,
	},
}

return {
	"sindrets/winshift.nvim",
	config = function()
		require("winshift").setup({
			focused_hl_group = "Visual",
		})
	end,
}

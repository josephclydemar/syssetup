return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
                theme = "gruvbox_dark",
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"filename", "diff"},
                lualine_c = {"branch", "diagnostics"},
            },
		})
	end,
}

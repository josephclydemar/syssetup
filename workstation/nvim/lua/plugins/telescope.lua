-- prompt_title = "Current Buffer Live Grep",
-- search_dirs = { vim.fn.expand("%:p") },

local telescope = "telescope"
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require(telescope).load_extension("fzf")
			require(telescope).setup({
				defaults = {
					-- path_display = { "shorten" },
					borderchars = {
						prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					},
				},
				extensions = {
					fzf = {},
				},
			})

			-- local actions = require("telescope.actions")
			-- local action_state = require("telescope.actions.state")
      require("core.keymaps." .. telescope).keymaps({
        builtin = require("telescope.builtin"),
      })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require(telescope .. ".themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}

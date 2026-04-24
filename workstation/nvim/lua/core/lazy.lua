-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ "nvim-tree/nvim-web-devicons", opts = {} },
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		{
			"rebelot/kanagawa.nvim",
			config = function()
				require("kanagawa").setup({
					compile = false, -- enable compiling the colorscheme
					undercurl = true, -- enable undercurls
					commentStyle = { italic = false },
					functionStyle = {},
					keywordStyle = { italic = false },
					statementStyle = { bold = true },
					typeStyle = {},
					transparent = false, -- do not set background color
					dimInactive = false, -- dim inactive window `:h hl-NormalNC`
					terminalColors = true, -- define vim.g.terminal_color_{0,17}
					colors = { -- add/modify theme and palette colors
						palette = {},
						theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
					},
					-- overrides = function(colors) -- add/modify highlights
					-- 	local theme = colors.theme
					-- 	return {
					-- 		TelescopeTitle = { fg = theme.ui.special, bold = true },
					-- 		TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					-- 		TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					-- 		TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					-- 		TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					-- 		TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					-- 		TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					-- 	}
					-- end,
				})
			end,
		},
		{
			"ellisonleao/gruvbox.nvim",
			config = function()
				require("gruvbox").setup({
					terminal_colors = true, -- add neovim terminal colors
					undercurl = true,
					underline = true,
					bold = false,
					italic = {
						strings = false,
						emphasis = false,
						comments = false,
						operators = false,
						folds = true,
					},
					strikethrough = true,
					invert_selection = false,
					invert_signs = false,
					invert_tabline = false,
					invert_intend_guides = false,
					inverse = true, -- invert background for search, diffs, statuslines and errors
					contrast = "", --"hard", -- can be "hard", "soft" or empty string
					palette_overrides = {
						-- bright_green = "#009900",
					},
					overrides = {
						-- Change Normal background
						Normal = { bg = "#1f2223" },
						Visual = { bg = "#4c98a6", fg = "#1d2021" },
					},
					dim_inactive = false,
					transparent_mode = false,
				})
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	-- checker = { enabled = true },
})

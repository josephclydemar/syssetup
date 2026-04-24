return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
	keys = {},
	config = function()
		require("auto-session").setup({
			enabled = false,
			session_lens = {
				load_on_setup = true, -- Initialize on startup (requires Telescope)
				theme_conf = {},
				previewer = false, -- File preview for session picker
				session_control = {
					control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
					control_filename = "session_control.json", -- File name of the session control file
				},
			},
		})
    require("core.keymaps.sessions").keymaps()
	end,
}

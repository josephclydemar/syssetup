local oil = "oil"
return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = {
      {"echasnovski/mini.icons", opts = {}},
    },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
    config = function ()
      require(oil).setup()
      vim.api.nvim_create_user_command("OilToggle", function()
        local current_buf = vim.api.nvim_get_current_buf()
        local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

        if current_filetype == "oil" then
          -- We use a command to go to the previous buffer
          vim.cmd("b#")
        else
          -- Open oil if not already in an oil buffer
          vim.cmd("Oil")
        end
      end, { nargs = 0 })
      require("core.keymaps." .. oil).keymaps()
    end
	},
}


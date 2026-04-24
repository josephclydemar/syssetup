return {
  keymaps = function (arg)
			vim.keymap.set("n", "<leader>ff", function()
				arg.builtin.find_files({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Find Files" })

			vim.keymap.set("n", "<leader>tt", function()
				arg.builtin.find_files({
					prompt_title = "No Ignore Find Files",
					hidden = true,
					no_ignore = true,
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "No Ignore Find Files" })

			-- vim.keymap.set("n", "<leader>tt", function()
			-- 	arg.builtin.find_files({
			--        prompt_title = "New Tab Find Files",
			--        hidden = true,
			-- 		attach_mappings = function(_, map)
			-- 			map("i", "<CR>", function(prompt_bufnr)
			-- 				local entry = action_state.get_selected_entry()
			-- 				local filepath = entry and entry.path or entry.filename
			--            actions.close(prompt_bufnr)
			--            vim.cmd("tabnew " .. filepath)
			-- 			end)
			-- 			return true
			-- 		end,
			-- 	})
			-- end, { desc = "New Tab Find Files" })

			-- vim.keymap.set("n", "<leader>yy", function()
			-- 	fgrep.live_fgrep({
			-- 		layout_strategy = "vertical",
			-- 		previewer = true,
			-- 		layout_config = {
			-- 			width = 0.9,
			-- 			height = 35,
			-- 			preview_height = 15,
			-- 			prompt_position = "bottom",
			-- 		},
			-- 		border = true,
			-- 	})
			-- end, { desc = "Live File Grep" })

			vim.keymap.set("n", "<leader>gg", function()
				arg.builtin.live_grep({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
					additional_args = function()
						return { "--pcre2" }
					end,
				})
			end, { desc = "Live Grep" })

			vim.keymap.set("n", "<leader>hh", function()
				arg.builtin.grep_string({
					prompt_title = "Grep String",
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Grep String" })

			vim.keymap.set("n", "<leader>ll", function()
				arg.builtin.quickfix({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Quickfix" })

			vim.keymap.set("n", "<leader>vv", function()
				arg.builtin.current_buffer_fuzzy_find({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Current Buffer Fuzzy Find" })

			vim.keymap.set("n", "<leader>bb", function()
				arg.builtin.buffers({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Buffers" })

			vim.keymap.set("n", "<leader>vc", function()
				arg.builtin.git_commits({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Git Commits" })

			vim.keymap.set("n", "<leader>vs", function()
				arg.builtin.git_status({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Git Status" })

			vim.keymap.set("n", "<leader>vb", function()
				arg.builtin.git_branches({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Git Branches" })

			vim.keymap.set("n", "<leader>oo", function()
				arg.builtin.oldfiles({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Old Files" })

			vim.keymap.set("n", "<leader>rf", function()
				arg.builtin.lsp_references({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "LSP References" })

			vim.keymap.set("n", "<leader>df", function()
				arg.builtin.lsp_definitions({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "LSP Definitions" })

			vim.keymap.set("n", "<leader>dd", function()
				arg.builtin.diagnostics({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Diagnostics" })

			vim.keymap.set("n", "<leader>mm", function()
				arg.builtin.marks({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Marks" })

			vim.keymap.set("n", "<leader>jj", function()
				arg.builtin.jumplist({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Jumplist" })

			vim.keymap.set("n", "<leader>kk", function()
				arg.builtin.keymaps({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Keymaps" })

			vim.keymap.set("n", "<leader>cc", function()
				arg.builtin.commands({
					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, { desc = "Commands" })

			vim.keymap.set("n", "<M-z>", function()
				arg.builtin.find_files({
					prompt_title = "NVIM Config Find Files",
					cwd = vim.fn.stdpath("config"),

					layout_strategy = "vertical",
					previewer = true,
					layout_config = {
						width = 0.9,
						height = 35,
						preview_height = 15,
						prompt_position = "bottom",
					},
					border = true,
				})
			end, {})
  end,
}

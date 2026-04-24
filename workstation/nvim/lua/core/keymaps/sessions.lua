return {
  keymaps = function ()
    vim.keymap.set("n", "<leader>wr", "<cmd>SessionSearch<CR>")
    vim.keymap.set("n", "<leader>ws", function ()
      local session_name = require("auto-session.lib").current_session_name()
      if session_name == "" then
        vim.ui.input({ prompt = "[SessionSave] Enter session name: " }, function (input)
          if input == "" then
            print("[SessionSave] cancelled.")
          else
            vim.cmd("SessionSave " .. input)
          end
        end)
      else
        vim.cmd("SessionSave " .. session_name)
      end
    end, { desc = "Save session" })

    vim.keymap.set("n", "<leader>wd", function ()
      local session_name = require("auto-session.lib").current_session_name()
      if session_name == "" then
        vim.ui.input({ prompt = "[SessionDelete] Enter session name: " }, function (input)
          vim.cmd("SessionDelete " .. input)
          print("Deleted Session: " .. input)
        end)
      else
        vim.cmd("SessionDelete " .. session_name)
        print("Deleted Session: " .. session_name)
      end
    end, { desc = "Delete session" })
  end
}

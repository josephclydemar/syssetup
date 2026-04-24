return {
    lsp = function ()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
      -- vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
      -- vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, {})
    end,
    dbg = {
      termdbg = function ()
        vim.keymap.set("n", "<leader>dbg", function()
          vim.ui.select(
            {
              "gdb",
              "lldb",
            },
            {
              prompt = "Choose Debugger",
              format_item = function (item)
                return item
              end
            },
            function (choosen_dbg)
              vim.ui.input(
                { prompt = "Enter executable binary path: " },
                function (executable_bin)
                  vim.cmd("Termdbg " .. choosen_dbg .. " " .. executable_bin)
                end
              )
            end
          )
        end, { desc = "Launch Termdbg" })
      end,
      nvim_dap = function(dap)
        vim.keymap.set("n", "<M-b>", function()
          dap.toggle_breakpoint()
        end, { desc = "Dap Toggle Breakpoint" })
        vim.keymap.set("n", "<M-v>", function()
          dap.set_breakpoint(vim.fn.input("Enter breakpoint condition: "))
        end, { desc = "Dap Set Conditional Breakpoint" })
        vim.keymap.set("n", "<M-c>", function()
          dap.continue()
        end, { desc = "Dap Continue" })
        vim.keymap.set("n", "<M-i>", function()
          dap.step_into()
        end, { desc = "Dap Step Into" })
        vim.keymap.set("n", "<M-o>", function()
          dap.step_out()
        end, { desc = "Dap Step Out" })
        vim.keymap.set("n", "<M-p>", function()
          dap.step_over()
        end, { desc = "Dap Step Over" })
        vim.keymap.set("n", "<M-[>", "<cmd>DapTerminate<CR>", { desc = "Dap Terminate" })
      end,
    },
}

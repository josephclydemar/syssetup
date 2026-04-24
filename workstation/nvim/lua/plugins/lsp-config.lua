return {
  {
    "epheien/termdbg",
    config = function ()
      require("core.keymaps.lsp").dbg.termdbg()
    end
  },
  {
    "williamboman/mason.nvim",
    -- version = "v1.11.0",
    commit = "fc98833b6da5de5a9c5b1446ac541577059555be",
    opts = {
      ensure_installed = {
          "codelldb",
          "debugpy",
      },
    },
    config = function ()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- version = "v1.32.0",
    commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function ()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "ts_ls",
          "intelephense",
          "tailwindcss",
          "pyright",
          "clangd",
          "rust_analyzer",
          -- "c3-lsp",
          -- "prettier",
          -- "eslint",
          -- "zls",
          -- "zls",
        },
      })
    end
    -- opts = {
    --   automatic_enable = true,
    --   automatic_installation = false,
    --   automatic_setup = false, -- this disables the broken `features.automatic_enable`
    -- },
  },
  {
    "neovim/nvim-lspconfig",
    -- version = false,
    commit = "4bc481b6f0c0cf3671fc894debd0e00347089a4e",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.intelephense.setup({
        capabilities = capabilities,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      -- lspconfig.c3_lsp.setup({
      --   capabilities = capabilities,
      -- })

      -- lspconfig.zls.setup({
      --     capabilities = capabilities,
      -- })
      require("core.keymaps.lsp").lsp()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.phpstan,
          null_ls.builtins.formatting.clang_format,
          -- null_ls.builtins.completion.spell,
          -- null_ls.builtins.diagnostics.eslint,
          require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        },
      })

      vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, { desc = "Format code" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
    	local dap = require("dap")
    	dap.configurations.c = {
    		{
    			name = "Launch",
    			type = "codelldb",
    			-- type = "gdb",
    			request = "launch",
    			program = function()
    				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    			end,
    			cwd = "${workspaceFolder}",
    			stopAtBeginningOfMainSubprogram = false,
    		},
    		-- {
    		-- 	name = "Select and attach to process",
    		-- 	type = "gdb",
    		-- 	request = "attach",
    		-- 	program = function()
    		-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    		-- 	end,
    		-- 	pid = function()
    		-- 		local name = vim.fn.input("Executable name (filter): ")
    		-- 		return require("dap.utils").pick_process({ filter = name })
    		-- 	end,
    		-- 	cwd = "${workspaceFolder}",
    		-- },
    		-- {
    		-- 	name = "Attach to gdbserver :1234",
    		-- 	type = "gdb",
    		-- 	request = "attach",
    		-- 	target = "localhost:1234",
    		-- 	program = function()
    		-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    		-- 	end,
    		-- 	cwd = "${workspaceFolder}",
    		-- },
    	}
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      require("core.keymaps.lsp").dbg.nvim_dap(dap)
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      event = "VeryLazy",
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
}

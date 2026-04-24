return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      local dbee = require("dbee")
      dbee.setup({
        sources = {
          -- require("dbee.sources").MemorySource:new({
          --   { name = "lesson05_db", type = "mysql", url = "mysql://laravel_practice_user:lpup@127.0.0.1:3306/lesson05_db", },
          -- }),
          -- require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
          require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json")
        },
      })

      vim.keymap.set("n", "<leader>dbt", dbee.toggle, { desc = "Open Database Client" })
      vim.keymap.set("n", "<leader>dbx", function()
        vim.ui.select(
          { "SELECT * FROM users;", "SELECT * FROM food;" },
          {
            prompt = "Select Query",
            format_item = function (item)
              return "Execute \"" .. item .. "\""
            end
          },
          function (choice)
            dbee.execute(choice)
          end
        )
      end, { desc = "Execute SQL Query" })
    end,
  },
}

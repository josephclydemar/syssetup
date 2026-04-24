return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "lua",
                    "bash",
                    "c",
                    "cpp",
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "php",
                    "python",
                    "rust",
                    "html",
                    "vim",
                    "vimdoc",
                    "query",
                    "elixir",
                    "heex",
                    "zig",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
            vim.filetype.add({
              extension = {
                  c3 = "c3",
                  c3i = "c3",
                  c3t = "c3",
              },
            })

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.c3 = {
              install_info = {
                url = "https://github.com/c3lang/tree-sitter-c3",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "main",
              },
            }
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    -- Defaults
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = false, -- Auto close on trailing </
                },
                -- Also override individual filetype configs, these take priority.
                -- Empty by default, useful if one of the "opts" global settings
                -- doesn't work well in a specific filetype
                per_filetype = {
                    ["html"] = {
                        enable_close = true,
                    },
                },
            })
        end,
    },
}

-- customize mason plugins
return {
    -- use mason-lspconfig to configure LSP installations
    {
        "williamboman/mason-lspconfig.nvim",
        -- overrides `require("mason-lspconfig").setup(...)`
        opts = {
            ensure_installed = {
                "bashls",
                "clangd",
                -- "cmakels",
                -- "cpptools",
                "cssls",
                "html",
                -- "isort",
                "jsonls",
                "lua_ls",
                "marksman",
                "neocmake",
                "pyright",
                "sqlls",
                "tsserver",
                "yamlls",
            },
            automatic_installation = true,
        },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
        "jay-babu/mason-null-ls.nvim",
        -- overrides `require("mason-null-ls").setup(...)`
        opts = {
            ensure_installed = { "black", "prettierd", "stylua" },
        },
        config = function(_, opts)
            local mason_null_ls = require "mason-null-ls"
            local null_ls = require "null-ls"
            mason_null_ls.setup(opts)
            mason_null_ls.setup {
                prettierd = function()
                    null_ls.register(
                        null_ls.builtins.formatting.prettierd.with {
                            extra_filetypes = { "json", "markdown" },
                        }
                    )
                end,
            }
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = {
            -- ensure_installed = { "python" },
        },
    },
}

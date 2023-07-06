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
                "isort",
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
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        -- overrides `require("mason-nvim-dap").setup(...)`
        opts = {
            -- ensure_installed = { "python" },
        },
    },
}

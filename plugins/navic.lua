--
-- local on_attach = function(client, bufnr)
--     if client.server_capabilities.documentSymbolProvider then
--         navic.attach(client, bufnr)
--     end
-- end
local _on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

return {
    {
        "SmiteshP/nvim-navic",
        lazy = false,
        config = function(_, opts)
            local navic = require "nvim-navic"
            require("lspconfig").clangd.setup {
                -- on_attach = function(client, bufnr) navic.attach(client, bufnr) end,
                on_attach = _on_attach,
            }
        end,
    },
}

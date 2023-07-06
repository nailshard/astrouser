return {
    {
        "nguyenvukhang/nvim-toggler",
        event = "BufRead",
        config = function() require("nvim-toggler").setup() end,
    },
    {
        "lukas-reineke/virt-column.nvim",
        event = "BufRead",
        config = function() require("virt-column").setup() end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function() require("catppuccin").setup {} end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    {
        "folke/zen-mode.nvim",
        cmd = { "ZenMode" },
        opts = {
            window = {
                backdrop = 0.85, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = 80, -- width of the Zen window
                height = 1, -- height of the Zen window
                -- by default, no options are changed for the Zen window
                -- uncomment any of the options below, or add other vim.wo options you want to apply
                options = {
                    signcolumn = "no",      -- disable signcolumn
                    number = false,         -- disable number column
                    relativenumber = false, -- disable relative numbers
                    cursorline = true,      -- disable cursorline
                    cursorcolumn = true,    -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
        },
    },
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
}

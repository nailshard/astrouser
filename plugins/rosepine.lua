return {
    "rose-pine/neovim",
    name = "rose-pine",
    -- lazy = false,
    priority = 1000,
    opts = {
        variant = "auto",
        dark_variant = "main",
        disable_italics = "false",
        disable_float_background = "false",
        bold_vert_split = false,
        dim_nc_background = false,
        groups = {
            background = "base",
            background_nc = "_experimental_nc",
            panel = "surface",
            panel_nc = "base",
            border = "highlight_med",
            comment = "muted",
            link = "iris",
            punctuation = "subtle",

            error = "love",
            hint = "iris",
            info = "foam",
            warn = "gold",

            headings = {
                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },
            -- or set all headings at once
            -- headings = 'subtle'
        },
        highlight_groups = {
            TSRainbowRed = { fg = "love" },
            TSRainbowBlue = { fg = "foam" },
            TSRainbowCyan = { fg = "rose" },
            TSRainbowGreen = { fg = "pine" },
            TSRainbowOrange = { fg = "#CAE7A7" },
            TSRainbowViolet = { fg = "iris" },
            TSRainbowYellow = { fg = "gold" },

            StatusNormal = { fg = "surface", bg = "rose" },
            StatusInsert = { fg = "surface", bg = "foam" },
            StatusVisual = { fg = "surface", bg = "iris" },
            StatusReplace = { fg = "surface", bg = "love" },
            StatusCommand = { fg = "surface", bg = "gold" },
            ColorColumn = { bg = "foam" },
            CursorLine = { bg = "foam", blend = 10 },
            StatusLine = { fg = "love", bg = "love", blend = 10 },
        },
    },
}

return {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
        local status = {
            user = require "user.util.statusline",
            astro = require "astronvim.utils.status",
        }
        local icons = require "astronvim.icons.nerd_font"

        local mode_text_color_1 = {
            "#1C2A43",
            "#002627",
            "#1C1836",
            "#2B0000",
            "#1D1905",
        }

        local mode_text_color_2 = {
            normal = "#8deef7",
            insert = "#9cf7b3",
            visual = "#ef92f7",
            replace = "#f78db9",
            command = "#f7d19c",
        }
        local bg3 = "#25253c"
        local bg2 = "#2d2d48"
        local lblue = "#929af7"
        local green2 = "#d1f79c"
        local pink1 = "#ef92f7"
        local pink2 = "#facbca"
        local pink3 = "#ef72f7"
        local green1 = "#9cf7b3"
        -- the first element of the configuration table is the statusline
        opts.statusline = {
            -- default highlight for the entire statusline
            hl = { fg = "fg", bg = "bg" },
            -----------------------------------
            ---- NOTE: Left side of neovim.----
            -----------------------------------

            -- Vim mode compnonent, using custom
            status.astro.component.builder {
                { provider = status.user.mode },
                -- mode_text = { icon = "test", padding = { right = 1, left = 1 } },
                -- hl = function() return { fg = mode_color(mode_text_color_1) } end,
                hl = { fg = bg2, bold = true },
                surround = {
                    separator = "left",
                    color = function()
                        return {

                            main = status.user.mode_color(mode_text_color_2),
                            -- main = status.user.mode_color(THEME.mode),
                            right = status.user.mode_color(THEME.grapple),
                        }
                    end,
                },
                update = {
                    "ModeChanged",
                    callback = vim.schedule_wrap(
                        function() vim.cmd.redrawstatus() end
                    ),
                },
            },
            -- Custom component for grapple
            status.astro.component.builder {
                { provider = status.user.grapple },
                hl = function()
                    return {
                        fg = status.user.set_grapple_color(mode_text_color_2),
                    }
                end,
                surround = {
                    separator = "left",
                    color = function()
                        return {
                            main = status.user.mode_color(THEME.grapple),
                            right = status.user.mode_color(THEME.tools),
                        }
                    end,
                },
            },
            -- Custom compnent for macro recordings
            status.astro.component.builder {
                { provider = status.user.macro_recording },
                hl = function()
                    return {
                        fg = status.user.mode_color(mode_text_color_2),
                        bold = true,
                    }
                end,
                surround = {
                    separator = "left",
                    color = function()
                        return {
                            main = status.user.mode_color(THEME.tools),
                            right = "bg",
                        }
                    end,
                },
                update = {
                    "RecordingEnter",
                    "RecordingLeave",
                    callback = vim.schedule_wrap(
                        function() vim.cmd.redrawstatus() end
                    ),
                },
            },
            -------------------------------------
            ---- NOTE: Center side of neovim.----
            -------------------------------------

            -- add a component for the current git branch if it exists and use no separator for the sections
            status.astro.component.git_branch {
                surround = { separator = "none" },
            },
            -- add a component for the current git diff if it exists and use no separator for the sections
            status.astro.component.git_diff {
                padding = { left = 1 },
                surround = { separator = "none" },
            },
            -- fill the rest of the statusline
            -- the elements after this will appear in the middle of the statusline
            status.astro.component.fill(),
            -- add a component to display if the LSP is loading, disable showing running client names, and use no separator
            status.astro.component.lsp {
                lsp_client_names = false,
                surround = { separator = "none", color = "bg" },
            },
            status.astro.component.builder {
                condition = function()
                    return require("nvim-navic").is_available()
                end,
                provider = function()
                    return require("nvim-navic").get_location { highlight = true }
                end,
                update = "CursorMoved",
                hl = function()
                    return {
                        bg = bg2,
                        fg = pink3,
                        bold = true,
                    }
                end,
            },
            -- fill the rest of the statusline
            -- the elements after this will appear on the right of the statusline
            status.astro.component.fill(),
            ------------------------------------
            ---- NOTE: Right side of neovim.----
            ------------------------------------
            status.astro.component.builder {
                -- condition = conditions.lsp_attached,
                -- update = { "LspAttach", "LspDetach" },

                -- You can keep it simple,
                -- provider = " [LSP]",

                -- Or complicate things a bit and get the servers names

                provider = function()
                    local names = {}
                    for i, server in
                    pairs(vim.lsp.get_active_clients { bufnr = 0 })
                    do
                        table.insert(names, server.name)
                    end
                    return " [" .. table.concat(names, " ") .. "]"
                end,

                hl = function()
                    return {
                        bg = bg2,
                        fg = pink3,
                        bold = true,
                    }
                end,
                -- },
            },

            -- add a component for the current diagnostics if it exists and use the right separator for the section
            status.astro.component.diagnostics {
                surround = { separator = "space_right" },
            },
            status.astro.component.builder {
                padding = { left = 1, right = 2 },
                -- provider = "%7(%l/%3L%):%2c %P",
                provider = "%5l:%2c ",
                -- %l = current line number
                -- %L = number of lines in the buffer
                -- %c = column number
                -- %P = percentage through file of displayed window

                -- hl = function() return { fg = "bg" } end,
                surround = {
                    separator = "none",
                    color = function()
                        return {
                            main = bg2,
                            left = bg2,
                        }
                    end,
                },
            },

            status.astro.component.builder {
                padding = { left = 2, right = 0 },
                static = {
                    sbar = {
                        "▁",
                        "▂",
                        "▃",
                        "▄",
                        "▅",
                        "▆",
                        "▇",
                        "█",
                    },
                    -- Another variant, because the more choice the better.
                    -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
                },
                provider = function(self)
                    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
                    local lines = vim.api.nvim_buf_line_count(0)
                    local i = math.floor((curr_line - 1) / lines * #self.sbar)
                        + 1
                    return string.rep(self.sbar[i], 2)
                end,
                hl = { fg = lblue, bg = bg2 },
            },
            status.astro.component.builder {
                padding = { left = 2, right = 1 },
                provider = function()
                    -- stackoverflow, compute human readable file size
                    local suffix = { "b", "k", "M", "G", "T", "P", "E" }
                    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
                    fsize = (fsize < 0 and 0) or fsize
                    if fsize < 1024 then return fsize .. suffix[1] end
                    local i = math.floor((math.log(fsize) / math.log(1024)))
                    return string.format(
                        " %.3g%s",
                        fsize / math.pow(1024, i),
                        suffix[i + 1]
                    )
                end,

                hl = { fg = lblue, bg = bg3 },
                surround = {
                    separator = "none",
                    color = function()
                        return {
                            main = bg3,
                            left = bg3,
                        }
                    end,
                },
            },
        }

        -- opts.winbar = status.astro.component.breadcrumbs {
        --   condition = status.astro.condition.is_active,
        --   hl = { fg = "winbar_fg", bg = "winbar_fg" },
        -- }

        opts.winbar = nil

        opts.tabline[2] = status.astro.heirline.make_buflist {
            {
                provider = function(self)
                    return self.is_visible and "" or ""
                end,
                hl = { fg = "buffer_bg", bg = "buffer_visible_bg" },
            },
            status.astro.component.tabline_file_info { close_button = false },
            {
                provider = function(self)
                    return self.is_visible and "" or ""
                end,
                hl = { fg = "buffer_bg", bg = "buffer_visible_bg" },
            },
        }

        opts.tabline[3] =
            status.astro.component.fill { hl = { bg = "buffer_visible_bg" } }

        return opts
    end,
}

return {
    {
        "everviolet/nvim",
        name = "evergarden",
        priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
        config = function()
            local fall = require("evergarden.colors").fall
            ---@type evergarden.types.colors
            local overrides = {
                green = "#61bd7b",
                text = "#f6ffde",
                subtext1 = "#efffc8",
                subtext0 = "#96B4AA",
                surface0 = "#141a16",
                mantle = "#0e120f",
                base = "#0a0d0b",
            }

            local theme = vim.tbl_deep_extend("force", fall, overrides)

            require("evergarden").setup({
                theme = {
                    variant = "winter", -- 'winter'|'fall'|'spring'|'summer'
                    accent = "green",
                },
                editor = {
                    transparent_background = false,
                    sign = { color = "none" },
                    float = {
                        color = "base",
                        solid_border = true,
                    },
                    completion = {
                        color = "mantle",
                    },
                },
                overrides = {
                    PickBorder = {
                        theme.base,
                        theme.base,
                    },
                    PickPrompt = {
                        theme.subtext0,
                        theme.base,
                    },
                    NoiceCmdlinePopupBorder = {
                        theme.green,
                        theme.base,
                    },
                    WinSeparator = {
                        theme.green,
                        theme.base,
                    },
                },
                color_overrides = theme,
            })
            vim.cmd("colorscheme evergarden")
        end,
    },
    -- {
    --   'vague2k/vague.nvim',
    --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --   priority = 1000, -- make sure to load this before all the other plugins
    --   config = function()
    --     -- NOTE: you do not need to call setup if you don't want to.
    --     require('vague').setup({
    --       -- optional configuration here
    --     })
    --     vim.cmd('colorscheme vague')
    --   end,
    -- },
}

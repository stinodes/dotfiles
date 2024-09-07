local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- local possession = require("possession")
-- local query = require("possession.query")
-- local utils = require("possession.utils")

dashboard.section.header.val = {
    [[                                                                                        ]],
    [[   ▄████████     ███      ▄█  ███▄▄▄▄    ▄██████▄  ████████▄     ▄████████    ▄████████ ]],
    [[  ███    ███ ▀█████████▄ ███  ███▀▀▀██▄ ███    ███ ███   ▀███   ███    ███   ███    ███ ]],
    [[  ███    █▀     ▀███▀▀██ ███▌ ███   ███ ███    ███ ███    ███   ███    █▀    ███    █▀  ]],
    [[  ███            ███   ▀ ███▌ ███   ███ ███    ███ ███    ███  ▄███▄▄▄       ███        ]],
    [[▀███████████     ███     ███▌ ███   ███ ███    ███ ███    ███ ▀▀███▀▀▀     ▀███████████ ]],
    [[         ███     ███     ███  ███   ███ ███    ███ ███    ███   ███    █▄           ███ ]],
    [[   ▄█    ███     ███     ███  ███   ███ ███    ███ ███   ▄███   ███    ███    ▄█    ███ ]],
    [[ ▄████████▀     ▄████▀   █▀    ▀█   █▀   ▀██████▀  ████████▀    ██████████  ▄████████▀  ]],
    [[                                                                                        ]],
}

-- local get_layout = function()
--     local layout = query.alpha_workspace_layout({}, dashboard.button, {
--         others_name = "Sessions",
--     })
--     for _, section in ipairs(layout) do
--         section.val[2].opts.position = "center"
--     end
--     return layout
-- end

dashboard.section.buttons.val = {
    -- dashboard.button("sl", "  List sessions", ":Telescope possession list<CR>"),
    dashboard.button("q", "  Quit NeoVIM", ":qa<CR>"),
}

dashboard.config.layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    -- {
    --     type = "group",
    --     val = utils.throttle(get_layout, 5000),
    --     opts = {
    --         position = "center",
    --     },
    -- },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.footer,
}

alpha.setup(dashboard.config)

-- possession.setup({
--     telescope = {
--         list = {
--             mappings = {
--                 save = { n = "<leader>sw" },
--                 load = { n = "<CR>" },
--                 delete = { n = "<leader>d" },
--                 rename = { n = "<leader>r" },
--             },
--         },
--     },
-- })

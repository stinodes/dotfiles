local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local smgr = require("session_manager")
local config = require("session_manager.config")

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
--     return {}
-- end

dashboard.section.buttons.val = {
    dashboard.button("sl", "  List sessions", ":SessionManager load_session<CR>"),
    dashboard.button("q", "  Quit NeoVIM", ":qa<CR>"),
}

dashboard.config.layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    -- {
    --     type = "group",
    --     val = get_layout(),
    --     opts = {
    --         position = "center",
    --     },
    -- },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.footer,
}

alpha.setup(dashboard.config)

smgr.setup({
    autoload_mode = config.AutoloadMode.Disabled
})

require("keybinds.session")

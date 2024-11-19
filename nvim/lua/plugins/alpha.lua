local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

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

dashboard.section.buttons.val = {
    dashboard.button("q", "  Quit NeoVIM", ":qa<CR>"),
}

dashboard.config.layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.footer,
}

alpha.setup(dashboard.config)

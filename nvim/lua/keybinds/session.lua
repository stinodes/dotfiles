local map_table = require("keybinds.map").map_table

local bindings = {
    ["<leader>sl"] = { ":SessionManager load_session<CR>", "List sessions" },
    ["<leader>su"] = { ":SessionManager save_current_session<CR>", "Save session" },
    ["<leader>sn"] = { ":SessionManager save_current_session<CR>", "Save session" },
    ["<leader>sa"] = { ":SessionManager save_current_session<CR>", "Save session" },
    ["<leader>sd"] = { ":SessionManager delete_session<CR>", "Delete session" },
}

map_table(bindings, nil, "Sessions: ")

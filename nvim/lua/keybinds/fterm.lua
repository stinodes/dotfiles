local fterm = require("FTerm")
local map_table = require("keybinds.map").map_table

vim.api.nvim_create_user_command("Scratch", function(opts)
	fterm.scratch({ cmd = opts.fargs })
end, { bang = true, nargs = "+" })

local bindings = {
	["<leader>tt"] = { fterm.toggle, "Toggle floating term", { "n", "t" } },
	["<leader>ts"] = { ":Scratch ", "Run a scratch command" },
	["<leader>tdu"] = { ":Scratch \"docker-compose up -d<CR>\"", "Run docker-compose up" },
	["<leader>tdd"] = { ":Scratch docker-compose down<CR>", "Run docker-compose down" },
}

map_table(bindings, nil, "Term: ")

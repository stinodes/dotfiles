local M = {}
local map_table = require("keybinds.map").map_table

local function global()
	local api = require("nvim-tree.api")

	local bindings = {
		["<C-e>"] = { api.tree.toggle, "Toggle tree" },
		["\\"] = { api.tree.focus, "Open tree" },
	}

	map_table(bindings, nil, "Nvim-tree: ")
end
M.global = global

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local bindings = {
		["h"] = { api.node.navigate.parent_close, "Close (parent) node" },
		["l"] = { api.node.open.edit, "Open node" },
	}

	api.config.mappings.default_on_attach(bufnr)

	map_table(bindings, bufnr, "Nvim-tree: ")
end
M.on_attach = on_attach

return M

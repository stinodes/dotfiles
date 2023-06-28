local map_table = require("keybinds.map").map_table

local builtin = require("telescope.builtin")

local bindings = {
    ["<leader>ff"] = { builtin.find_files, "Fuzzy find files" },
    ["<leader>fg"] = { builtin.live_grep, "Live grep" },
    ["<leader>fb"] = { builtin.buffers, "Show open buffers" },

    ["<leader>gr"] = { builtin.lsp_references, "Show symbol references" },
    ["<leader>gd"] = { builtin.lsp_definitions, "Show symbol definitions" },
    ["<leader>gt"] = { builtin.lsp_type_definitions, "Show symbol type definitions" },
    ["<leader>gs"] = { builtin.lsp_document_symbols, "Show document symbols" },
    ["<leader>gw"] = { builtin.lsp_workspace_symbols, "Show workspace symbols" },
    ["<leader>gT"] = { builtin.treesitter, "Show treesitter symbols" },
    ["<leader>gi"] = { builtin.lsp_implementations, "Show implementations" },

    ["<leader>sl"] = { ":Telescope possession list<CR>", "Sessions" },
}

map_table(bindings, nil, "Telescope: ")

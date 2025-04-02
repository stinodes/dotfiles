local map_table = require("keybinds.map").map_table

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local bindings = {
    ["*"] = { "*N", "Jump to match centered" },
    ["n"] = { "nzz", "Jump to next match centered" },
    ["N"] = { "Nzz", "Jump to previous match centered" },

    ["<leader>w"] = { ":update<CR>", "Save buffer" },
    ["<leader>W"] = { ":wall<CR>", "Save all buffers" },

    ["<leader>q"] = { ":q<CR>", "Close window" },
    ["<leader>Q"] = { ":q!<CR>", "Force close window" },

    ["<S-l>"] = { ":BufferLineCycleNext<Cr>", "Cycle to next buffer" },
    ["<S-h>"] = { ":BufferLineCyclePrev<Cr>", "Cycle to next buffer" },
    ["<leader>d"] = { ":Bdelete<cr>", "Close buffer" },
    ["<leader>D"] = { ":bufdo :Bdelete<cr>", "Close all buffers" },

    ["<leader>p"] = { '"_dP', "Paste without yank" },

    ["<leader>y"] = { '"+y', "Yank and copy to clipboard", { "n", "v" } },
    ["<leader>Y"] = { '"+Y', "Yank and copy line to clipboard" },

    ["<C-j>"] = { ":move .+1<CR>", "Move line up" },
    ["<C-k>"] = { ":move .-2<CR>", "Move line up" },

    ["<C-/>"] = { "<Plug>(comment_toggle_linewise_visual)", "Toggle comment block", "v" },

    ["<leader>sl"] = { function() require('nvim-possession').list() end, "List sessions" },
    ["<leader>su"] = { function() require('nvim-possession').update() end, "Update session" },
    ["<leader>sn"] = { function() require('nvim-possession').new() end, "Create session" },
    ["<leader>sa"] = { function() require('nvim-possession').new() end, "Create session" },
    ["<leader>sd"] = { function() require('nvim-possession').delete() end, "Delete session" },
}

map_table(bindings, nil, "")

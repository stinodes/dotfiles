local M = {}
local map_table = require('keybinds.map').map_table

local bindings = {
    ['<leader>ca'] = { ':CodeActionMenu<CR>', 'Open code action window' },
    ['<leader>r'] = { vim.lsp.buf.rename, 'Rename symbol and references' },
    ['K'] = { vim.lsp.buf.hover, 'Show hover doc window' }
}

local function on_attach(bufnr)
    map_table(bindings, bufnr, 'LSP: ')
end
M.on_attach = on_attach

return M

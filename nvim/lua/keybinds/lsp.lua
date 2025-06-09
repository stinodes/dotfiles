local M = {}
local map_table = require('keybinds.map').map_table

local bindings = {
    ['K'] = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Show hover doc window' },
    ['gd'] = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Jump to definition' },
    ['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Jump to declaration' },
    ['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Jump to implementation' },
    ['go'] = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Jump to type definition' },
    ['gr'] = { '<cmd>lua vim.lsp.buf.references()<cr>', 'Show references' },
    ['gs'] = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show signature help' },
    ['<leader>r'] = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol and references' },
    ['<leader>ca'] = { '<cmd>CodeActionMenu<CR>', 'Open code action window' },
}

local function on_attach(bufnr)
    map_table(bindings, bufnr, 'LSP: ')
end
M.on_attach = on_attach

return M

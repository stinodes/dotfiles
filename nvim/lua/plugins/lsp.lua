require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local lsp = require("lsp-zero")
local keybinds = require("keybinds.lsp")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    keybinds.on_attach(bufnr)
end)

lsp.format_on_save({
    format_opts = {
        timeout_ms = 10000,
    },
    servers = {
        ["lua_ls"] = { "lua" },
    },
})

lsp.setup()

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            source = "always",
            prefix = " ",
            scope = "cursor",
        })
    end,
})

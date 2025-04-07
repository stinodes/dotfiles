local lsp = require("lsp-zero")
local keybinds = require("keybinds.lsp")

lsp.preset("recommended")

local on_attach = function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    lsp.buffer_autoformat()
    keybinds.on_attach(bufnr)
end

lsp.on_attach(on_attach)

lsp.setup()

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
require("mason-lspconfig").setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
        cssls = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            require("lspconfig").cssls.setup({
                capabilities = capabilities,
            })
        end,

        ts_ls = function()
            require("lspconfig").ts_ls.setup({
                on_init = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentFormattingRangeProvider = false
                end,
            })
        end,
        stylelint_lsp = function()
            require("lspconfig").stylelint_lsp.setup({
                filetypes = { "css", "less", "scss", "sugarss" },
                settings = {
                    stylelintplus = {
                        autoFixOnFormat = true,
                        -- autoFixOnSave = true,
                    },
                },
            })
        end,
    },
})

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "supermaven" },
        { name = "luasnip" },
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end)
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

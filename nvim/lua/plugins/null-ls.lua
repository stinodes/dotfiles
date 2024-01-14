local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.eslint_d,
        formatting.prettier,
        formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" },
        }),
        formatting.stylua,
        formatting.xmlformat.with({
            extra_args = { "--blanks" },
        }),

        diagnostics.eslint_d,
        diagnostics.tidy,

        code_actions.eslint_d,
    },
    on_attach = function(client, bufnr)
        if client.name == "tsserver" then
            -- Disable TS formatting
            client.server_capabilities.documentFormattingProvider = false
        elseif client.supports_method("textDocument/formatting") then
            -- Enable format on save
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(filterClient)
                            -- Again, make sure to disable TS formatting
                            if filterClient.name == "tsserver" then
                                return false
                            end
                            return true
                        end,
                    })
                end,
            })
        end
    end,
})

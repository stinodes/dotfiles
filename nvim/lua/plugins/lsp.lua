return {
    -- Mason
    {
        'mason-org/mason-lspconfig.nvim',
        version = 'v2.0.0',
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
            -- local lsp_defaults = require("lspconfig").util.default_config
            --
            -- -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- -- This should be executed before you configure any language server
            -- lsp_defaults.capabilities = vim.tbl_deep_extend(
            -- 	"force",
            -- 	lsp_defaults.capabilities,
            -- 	require("cmp_nvim_lsp").default_capabilities()
            -- )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    require('keybinds.lsp').on_attach(event.buf)
                end,
            })

            vim.api.nvim_create_autocmd('CursorHold', {
                callback = function()
                    vim.diagnostic.open_float(nil, {
                        focusable = false,
                        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
                        source = 'always',
                        prefix = ' ',
                        scope = 'cursor',
                    })
                end,
            })

            vim.lsp.config('ts_ls', {
                on_init = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentFormattingRangeProvider = false
                end,
            })

            -- require('mason-lspconfig').setup({
            --     handlers = {
            --         -- this first function is the "default handler"
            --         -- it applies to every language server without a "custom handler"
            --         function(server_name)
            --             require("lspconfig")[server_name].setup({})
            --         end,
            --         cssls = function()
            --             local capabilities =
            --
            --                 require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            --             require("lspconfig").cssls.setup({
            --                 capabilities = capabilities,
            --             })
            --         end,
            --
            --         ts_ls = function()
            --             require("lspconfig").ts_ls.setup({
            --                 on_init = function(client)
            --                     client.server_capabilities.documentFormattingProvider = false
            --                     client.server_capabilities.documentFormattingRangeProvider = false
            --                 end,
            --             })
            --         end,
            --         stylelint_lsp = function()
            --             require("lspconfig").stylelint_lsp.setup({
            --                 filetypes = { "css", "less", "scss", "sugarss" },
            --                 settings = {
            --                     stylelintplus = {
            --                         autoFixOnFormat = true,
            --                         -- autoFixOnSave = true,
            --                     },
            --                 },
            --             })
            --         end,
            --     }
            -- })
        end,
        opts = {
            ensure_installed = {
                'cssls',
                'ts_ls',
                'lua_ls',
                'gopls',
                'tailwindcss',
            },
        },
        dependencies = {
            {
                'neovim/nvim-lspconfig',
                tag = 'v2.2.0',
                cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
                event = { 'BufReadPre', 'BufNewFile' },
            },
            {
                'mason-org/mason.nvim',
                tag = 'v2.0.0',
                opts = {
                    ui = {
                        border = 'rounded',
                        icons = {
                            package_installed = '✓',
                            package_pending = '➜',
                            package_uninstalled = '✗',
                        },
                    },
                },
            },
        },
    },
    -- Autocompletion
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = {
            'rafamadriz/friendly-snippets',
            {
                'supermaven-inc/supermaven-nvim',
                opts = {
                    keymaps = {
                        accept_suggestion = '<C-s>',
                        accept_word = '<C-w>',
                        clear_suggestion = '<C-x>',
                    },
                    ignore_filetypes = { 'log' },
                },
            },
            {
                'huijiro/blink-cmp-supermaven',
            },
        },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'enter',
                ['<Tab>'] = {
                    'select_next',
                    'fallback',
                },
                ['<S-Tab>'] = {
                    'select_prev',
                    'fallback',
                },
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = true } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    supermaven = {
                        name = 'supermaven',
                        module = 'blink-cmp-supermaven',
                        async = true,
                    },
                },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
    },
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    },
    {
        'antosha417/nvim-lsp-file-operations',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-tree.lua' },
        },
    },
}

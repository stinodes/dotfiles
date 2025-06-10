return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = { enabled = true },
            explorer = { enabled = true },
            picker = {
                enabled = true,
                explorer = {
                    follow_file = true,
                    auto_close = true,
                    matcher = {
                        fuzzy = true,
                    }
                }
            },
            input = { enabled = true },
            indent = { enabled = true },
            terminal = { enabled = true },
        },
        keys = {
            {
                '<leader>e',
                function()
                    Snacks.picker.explorer()
                end,
                desc = 'Open explorer',
            },
            {
                '<leader>t',
                function()
                    Snacks.terminal.toggle('zsh', {
                        auto_close = true,
                        auto_insert = true,
                    })
                end,
                desc = 'Open floating terminal',
            },
            {
                '<leader>lg',
                function()
                    Snacks.terminal.toggle('lazygit', {
                        auto_close = true,
                        auto_insert = true,
                    })
                end,
                desc = 'Open lazygit',
            },
        },
    },
}

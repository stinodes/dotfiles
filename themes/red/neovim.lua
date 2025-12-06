 return {
        'deparr/tairiki.nvim',
        lazy = false,
        priority = 1000, -- recommended if you use tairiki as your default theme
        init = function()
            vim.cmd('colorscheme tairiki')
        end,
    }

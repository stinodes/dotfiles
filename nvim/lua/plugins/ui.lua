return {
    { 'kyazdani42/nvim-web-devicons' },
    { 'norcalli/nvim-colorizer.lua' },
    -- {
    --   'projekt0n/github-nvim-theme',
    --   init = function()
    --     vim.cmd('colorscheme github_dark_default')
    --   end,
    -- },
    {
        'vague2k/vague.nvim',
        init = function()
            vim.cmd('colorscheme vague')
        end,
        opts = {
            plugins = {
                cmp = {
                    match = 'bold',
                    match_fuzzy = 'bold',
                },
                dashboard = {

                    footer = 'italic',
                },
                lsp = {
                    diagnostic_error = 'bold',
                    diagnostic_hint = 'none',
                    diagnostic_info = 'italic',
                    diagnostic_ok = 'none',
                    diagnostic_warn = 'bold',
                },
                neotest = {
                    focused = 'bold',
                    adapter_name = 'bold',
                },
                telescope = {
                    match = 'bold',
                },
            },
        },
    },
    {
        'folke/noice.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' },
    },
    { 'folke/which-key.nvim' },
    { 'j-hui/fidget.nvim' },
}

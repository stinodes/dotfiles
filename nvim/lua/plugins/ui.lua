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
        'deparr/tairiki.nvim',
        lazy = false,
        priority = 1000, -- recommended if you use tairiki as your default theme
        init = function()
            vim.cmd('colorscheme tairiki')
        end,
    },
    {
        'folke/noice.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' },
    },
    { 'folke/which-key.nvim' },
    { 'j-hui/fidget.nvim' },
}

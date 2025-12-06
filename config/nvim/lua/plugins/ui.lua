return {
    { 'kyazdani42/nvim-web-devicons' },
    { 'norcalli/nvim-colorizer.lua' },
    -- {
    --   'projekt0n/github-nvim-theme',
    --   init = function()
    --     vim.cmd('colorscheme github_dark_default')
    --   end,
    -- },
    -- {
    --   'vague2k/vague.nvim',
    --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --   priority = 1000, -- make sure to load this before all the other plugins
    --   config = function()
    --     -- NOTE: you do not need to call setup if you don't want to.
    --     require('vague').setup({
    --       -- optional configuration here
    --     })
    --     vim.cmd('colorscheme vague')
    --   end,
    -- },
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {},
        dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    },
    { 'folke/which-key.nvim' },
    { 'j-hui/fidget.nvim' },
}

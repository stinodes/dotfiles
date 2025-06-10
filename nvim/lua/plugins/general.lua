return {
    { 'nvim-lua/plenary.nvim' },
    { 'numToStr/Comment.nvim' },
    {
        'max397574/better-escape.nvim',
        opts = {
            mappings = {
                i = {
                    j = {
                        k = '<Esc>',
                    },
                },
                v = {
                    j = {
                        k = '<Esc>',
                    },
                },
            },
        },
    },
}

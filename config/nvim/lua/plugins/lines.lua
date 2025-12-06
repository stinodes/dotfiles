return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'BufEnter',
        dependencies = { 'projekt0n/github-nvim-theme' },
        opts = {
            options = {
                component_separators = '|',
                section_separators = '',
                -- section_separators = { left = "", right = "" },

                icons_enabled = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        color = { gui = 'bold' },
                        right_padding = 2,
                        left_padding = 8,
                    },
                },
                lualine_b = {
                    { 'branch' },
                    { 'diff' },
                    { 'filename' },
                },
                lualine_c = {
                    { 'diagnostics' },
                },

                lualine_x = {
                    'filetype',
                    'fileformat',
                },
                lualine_y = {
                    'progress',
                },
                lualine_z = {
                    { 'location', left_padding = 2, right_padding = 4 },
                },
            },
        },
    },
    {
        'akinsho/bufferline.nvim',
        branch = 'main',
        dependencies = { 'moll/vim-bbye' },
        opts = {
            options = {
                -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
                offsets = {
                    { filetype = 'NvimTree', text = '', padding = 1 },
                    { filetype = 'Outline',  text = '', padding = 1 },
                },
                text = 'File Explorer',
                text_align = 'center',
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(_, level)
                    local icon = level:match('error') and ' ' or ''
                    return ' ' .. icon
                end,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
}

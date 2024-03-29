local M = {}

local function bufferline()
    local bl = require("bufferline")

    bl.setup({
        options = {
            -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
            offsets = {
                { filetype = "NvimTree", text = "", padding = 1 },
                { filetype = "Outline",  text = "", padding = 1 },
            },
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, level)
                local icon = level:match("error") and " " or ""
                return " " .. icon
            end,
            show_buffer_icons = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = "thick",
        },
    })
end
M.bufferline = bufferline

local function session_name()
    return require("possession.session").session_name or ""
end

local function lualine()
    local ll = require("lualine")
    ll.setup({
        options = {
            component_separators = "|",
            section_separators = { left = "", right = "" },

            icons_enabled = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    color = { gui = "bold" },
                    right_padding = 2,
                    left_padding = 8,
                },
            },
            lualine_b = {
                { "branch" },
                { "diff" },
                { session_name, color = { gui = "bold" } },
                { "filename" },
            },
            lualine_c = {
                { "diagnostics" },
            },

            lualine_x = {
                "filetype",
                "fileformat",
            },
            lualine_y = {
                "progress",
            },
            lualine_z = {
                { "location", left_padding = 2, right_padding = 4 },
            },
        },
    })
end
M.lualine = lualine

return M

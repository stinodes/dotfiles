-- TELESCOPE WOOOH
return {
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            local telescope = require("telescope")
            require("keybinds.telescope")
            telescope.load_extension("ui-select")
        end,
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    }
}

local telescope = require("telescope")

telescope.setup()

telescope.load_extension("ui-select")
telescope.load_extension("possession")

require("keybinds.telescope")

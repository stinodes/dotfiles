local telescope = require('telescope')

telescope.setup()

telescope.load_extension('ui-select')

require('keybinds.telescope')

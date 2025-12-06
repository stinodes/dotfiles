local map_table = require('keybinds.map').map_table

local strudel = require('strudel')

local bindings = {
  ['<leader>sl'] = { strudel.launch, 'Launch Strudel' },
  ['<leader>sq'] = { strudel.quit, 'Quit Strudel' },
  ['<leader>ss'] = { strudel.toggle, 'Toggle Strudel playing' },
  ['<leader>su'] = { strudel.update, 'Toggle Strudel playing' },
  ['<leader>se'] = { strudel.execute, 'Toggle Strudel playing' },
}

map_table(bindings, nil, 'Telescope: ')

require("core.packer")
require("core.settings")
require("core.kittymargin") -- won't work with other than kitty
require("plugins")
require("keybinds.core")

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

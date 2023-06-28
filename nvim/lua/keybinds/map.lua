local M = {}

local function map(mode, key, value, opt)
    if not opt then
        opt = {}
    end
    opt.silent = true
    vim.keymap.set(mode, key, value, opt)
end
M.map = map


local function map_table(bindings, bufnr, prefix)
    local scopedMap = function(mode, key, value, desc)
        local opts = {
            desc = desc,
            noremap = true,
            silent = true,
            nowait = true
        }
        if (bufnr ~= nil) then
            opts.buffer = bufnr
        end

        map(mode, key, value, opts)
    end

    for key, mapping in pairs(bindings) do
        local value = mapping[1]
        local desc = mapping[2]
        local mode = mapping[3] or 'n'

        scopedMap(mode, key, value, prefix .. desc)
    end
end
M.map_table = map_table

return M

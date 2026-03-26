local paths = { '/', '/../' }
local tmpdir = '/tmp' -- I use /tmp/godot.pipe
local cwd = vim.fn.getcwd()

local path = ''
local is_godot = false
local is_running = false

for _, value in pairs(paths) do
    if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
        path = cwd .. value
        is_godot = true
        break
    end
end

local server = path .. '/server.pipe'
is_running = vim.uv.fs_stat(server)

if is_godot and not is_running then
    vim.fn.serverstart(server)
end

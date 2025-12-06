return {
    {
        'gruvw/strudel.nvim',
        build = 'npm install',
        config = function()
            require('strudel').setup({
                start_on_launch = false,
                browser_exec_path = "/usr/bin/chromium",
            })
            require('keybinds.strudel')
        end,
    },
}

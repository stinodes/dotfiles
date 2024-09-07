local augroup = vim.api.nvim_create_augroup("kitty_mp", { clear = true })

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    group = augroup,
    callback = function()
        vim.fn.jobstart(
           'kitty @ set-spacing padding=10 margin=10',
            { detach = true }
        )
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    group = augroup,
    callback = function()
        vim.fn.jobstart(
           'kitty @ set-spacing padding=0 margin=0',
            { detach = true }
        )
    end,
})

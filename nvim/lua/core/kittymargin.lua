local augroup = vim.api.nvim_create_augroup("kitty_mp", { clear = true })

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    group = augroup,
    callback = function()
        vim.system({ "kitty", "@", "set-spacing", "padding=10", "margin=0" })
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    group = augroup,
    callback = function()
        vim.system({ "kitty", "@", "set-spacing", "padding=0", "margin=0" })
    end,
})

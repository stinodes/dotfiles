local vimOpts = {
    termguicolors = true,

    timeoutlen = 500,
    updatetime = 50,

    scrolloff = 8,

    number = true,
    numberwidth = 6,
    relativenumber = true,

    colorcolumn = "80",
    cursorline = true,
    textwidth = 300,
    wrap = false,

    expandtab = true,
    cindent = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = -1,
    list = true,
    listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂",

    undofile = true,
    swapfile = false,
    history = 50,

    splitright = true,
    splitbelow = true,

    hlsearch = false,
    incsearch = true,
}

for x, y in pairs(vimOpts) do
    vim.opt[x] = y
end

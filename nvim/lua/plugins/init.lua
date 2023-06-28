-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "init.lua",
    command = "source <afile> | PackerCompile",
})
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return packer.startup({
    function(use)
        -- Package Manager --
        use("wbthomason/packer.nvim")

        -- Dependencies --
        use("nvim-lua/plenary.nvim")
        use({
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup()
            end,
        })

        -- Theming --
        use({
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("catppuccin").setup({
                    flavour = "mocha",
                    integrations = {
                        fidget = true,
                        mason = true,
                        noice = true,
                        which_key = true,
                    },
                })
                vim.cmd.colorscheme("catppuccin")
            end,
        })

        -- UI Elements --
        -- Startup
        use({
            "goolord/alpha-nvim",
            config = function()
                require("plugins.alpha")
            end,
            requires = { "nvim-tree/nvim-web-devicons", "jedrzejboczar/possession.nvim" },
        })
        -- File Manager
        use({
            "nvim-tree/nvim-tree.lua",
            config = function()
                require("keybinds.nvimtree").global()
                require("nvim-tree").setup({
                    on_attach = require("keybinds.nvimtree").on_attach,
                })
            end,
        })
        -- Misc improvements
        use({
            "folke/noice.nvim",
            config = function()
                require("noice").setup()
            end,
            requires = { "MunifTanjim/nui.nvim" },
        })
        -- TELESCOPE WOOOH
        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins.telescope")
            end,
            tag = "0.1.1",
            -- or                            , branch = '0.1.x',
            requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
        })
        -- Which key
        use({
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
            end,
        })
        -- Term
        use({
            "numToStr/FTerm.nvim",
            config = function()
                require("keybinds.fterm")
            end,
        })
        -- Lines
        use({
            "nvim-lualine/lualine.nvim",
            event = "BufEnter",
            config = function()
                require("plugins.lines").lualine()
            end,
        })
        use({
            "akinsho/bufferline.nvim",
            tag = "v2.*",
            config = function()
                require("plugins.lines").bufferline()
            end,
            after = "catppuccin",
            requires = { "moll/vim-bbye" },
        })
        use({
            "j-hui/fidget.nvim",
            config = function()
                require("fidget").setup({
                    window = {
                        blend = 0,
                    },
                })
            end,
            after = "lualine.nvim",
        })
        use({
            "iamcco/markdown-preview.nvim",
            run = "cd app && npm install",
            setup = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        })

        -- LSP --
        use({
            "VonHeikemen/lsp-zero.nvim",
            config = function()
                require("plugins.lsp")
            end,
            requires = {
                -- LSP
                "neovim/nvim-lspconfig",
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",

                -- Completion
                "hrsh7th/nvim-cmp",
                "hrsh7th/cmp-nvim-lsp",

                -- Snippets
                "L3MON4D3/LuaSnip",
                "rafamadriz/friendly-snippets",
                "saadparwaiz1/cmp_luasnip",
            },
        })
        use({
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu",
        })
        use({
            "antosha417/nvim-lsp-file-operations",
            config = function()
                require("lsp-file-operations").setup()
            end,
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-tree.lua",
            },
        })

        -- Null LS
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require("plugins.null-ls")
            end,
            requires = { "nvim-lua/plenary.nvim" },
        })

        -- Code Highlighting --
        use({
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
            config = function()
                require("nvim-treesitter.configs").setup({
                    auto_install = true,
                    indent = { enable = true },
                    highlight = { enable = true },
                })
            end,
        })
        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup()
            end,
        })
        use({
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        })

        -- QOF
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        })

        use({
            "max397574/better-escape.nvim",
            config = function()
                require("better_escape").setup({
                    mapping = { "jk" },
                })
            end,
        })
    end,
    config = {
        auto_clean = true,
        compile_on_sync = true,
        git = { clone_timeout = 6000 },
        display = {
            working_sym = "ﲊ",
            error_sym = "✗ ",
            done_sym = " ",
            removed_sym = " ",
            moved_sym = "",
            open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end,
        },
    },
})

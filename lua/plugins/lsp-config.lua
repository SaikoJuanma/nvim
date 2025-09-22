return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Define configs
            vim.lsp.config.lua_ls = {}

            vim.lsp.config.clangd = {
                cmd = { "clangd", "--header-insertion=never" },
                init_options = {
                    completeUnimported = false,
                    usePlaceholders = true,
                    clangdFileStatus = true,
                }
            }

            -- Enable them (this part was missing)
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("clangd")
        end
    }
}

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
            vim.lsp.config.clangd = {
                cmd = { "clangd", "--header-insertion=never" },
                init_options = {
                    completeUnimported = false,
                    usePlaceholders = true,
                    clangdFileStatus = true,
                }
            }

            vim.lsp.config.lua_ls = {}

            vim.lsp.enable("clangd")
            vim.lsp.enable("lua_ls")
            
        end
    }
}

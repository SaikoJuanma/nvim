return{
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({
                cmd = { "clangd", "--header-insertion=never" },
                init_options = {
                    completeUnimported = false,
                    usePlaceholders = true,
                    clangdFileStatus = true,
                }
            })
        end
    }
}

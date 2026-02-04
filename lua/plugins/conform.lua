return{
  'stevearc/conform.nvim',
  opts = {
        formatters_by_ft = {
            c = {"clang-format"},
            cpp = {"clang-format"},
        },
    },
    config = function ()

        vim.filetype.add({
            extension = {
                overlay = "c",
            },
        })

        -- Setup conform.nvim
        require("conform").setup({
            formatters_by_ft = {
                c = {"clang-format"},
                cpp = {"clang-format"},
            },
        })
        -- Auto format on save for C files
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = {"*.c", "*.cpp", "*.h", "*.hpp", "*.overlay"},
            callback = function()
                require("conform").format()
            end,
        })
    end,
}

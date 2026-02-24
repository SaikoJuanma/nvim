return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      c = {"clang-format"},
      cpp = {"clang-format"},
      rust = {"rustfmt"}, -- Add this!
    },
  },
  config = function(self, opts) -- Use opts from above
    require("conform").setup(opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      -- Ensure *.rs is in this list
      pattern = {"*.c", "*.cpp", "*.h", "*.hpp", "*.overlay", "*.rs"},
      callback = function()
        require("conform").format()
      end,
    })
  end,
}

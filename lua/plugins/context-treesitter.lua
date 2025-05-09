return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      vim.filetype.add({
        extension = {
          overlay = "dts",
        },
      })
    end
  }
}

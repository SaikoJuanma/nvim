return(
    {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("nvim-treesitter").setup({
          auto_install = true,  -- Add this line
          sync_install = false,
          highlight = { enable = true,
            additional_vim_regex_highlighting = false,},
          indent = { enable = true },
        })
    end}
)

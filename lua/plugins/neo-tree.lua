return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        window = {
          mappings = {
            ["H"] = "toggle_hidden",
          },
        },
      },
    })

    -- Set transparency by clearing background highlight groups
    vim.cmd([[
      highlight NeoTreeNormal guibg=NONE ctermbg=NONE
      highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
      highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  end
}

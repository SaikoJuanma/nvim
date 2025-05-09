return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = false, -- Keep filtered items completely hidden
          hide_by_name = {
            ".git",
            "node_modules",
            ".cache",
          },
          hide_hidden = true, -- This is the important line for dotfiles
        },
        window = {
          mappings = {
            ["H"] = "toggle_hidden",
          },
        },
      },
    })

    -- Set transparency
    vim.cmd([[
      highlight NeoTreeNormal guibg=NONE ctermbg=NONE
      highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
      highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  end
}

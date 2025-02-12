return {
  'nvzone/showkeys',
  config = function()
    require('showkeys').setup({
      winopts = {
        relative = "editor",
        style = "minimal",
        border = "single",
        height = 1,
        zindex = 100,
      },
      winhl = "FloatBorder:Comment,Normal:Normal",
      timeout = 3,
      maxkeys = 5,
      show_count = false,
      excluded_modes = {},
      position = "bottom-right",
      keyformat = {
        ["<BS>"] = "󰁮 ",
        ["<CR>"] = "󰘌",
        ["<Space>"] = "󱁐",
        ["<Up>"] = "󰁝",
        ["<Down>"] = "󰁅",
        ["<Left>"] = "󰁍",
        ["<Right>"] = "󰁔",
        ["<PageUp>"] = "Page 󰁝",
        ["<PageDown>"] = "Page 󰁅",
        ["<M>"] = "Alt",
        ["<C>"] = "Ctrl",
      },
    })
    
    -- Auto-start showkeys when Neovim starts
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("ShowkeysToggle")
      end,
    })
  end
}

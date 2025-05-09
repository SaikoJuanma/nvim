-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--         vim.o.background = "dark" -- or "light" for light mode
--         vim.cmd([[colorscheme gruvbox]])
--     end,
--     opts = ...
-- }
--
-- return {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,  -- Ensure this plugin loads early
--     config = function()
--         -- Set the background to dark (or "light" for light mode)
--         vim.o.background = "dark"
--
--         -- Load and configure Kanagawa
--         require("kanagawa").setup({
--             -- (Optional) Add any custom configuration options here
--             -- For example, you can specify the variant ("dragon", "wave", or "lotus")
--             transparent = true,
--             colorscheme = "kanagawa-dragon",  -- Use the "dragon" variant
--         })
--
--         -- Apply the Kanagawa colorscheme
--         vim.cmd([[colorscheme kanagawa-dragon]])
--     end,
--     -- (Optional) Add any additional options here
--     -- opts = { ... }
-- }
--
-- return {
--     "catppuccin/nvim",
--     priority = 1000,  -- Ensure this plugin loads early
--     config = function()
--         -- Set the background to dark (or "light" for light mode)
--         vim.o.background = "dark"
--
--         -- Load and configure Catppuccin
--         require("catppuccin").setup({
--             flavour = "mocha",  -- Set the flavour to mocha
--             background = {      -- Configure background settings
--                 light = "latte",
--                 dark = "mocha",
--             },
--             transparent_background = false,  -- Set to true for transparent background
--             term_colors = false,            -- Set to true to set terminal colors
--             dim_inactive = {
--                 enabled = false,  -- Set to true to dim inactive windows
--                 shade = "dark",
--                 percentage = 0.15,
--             },
--             no_italic = false,  -- Set to true to disable italics
--             no_bold = false,    -- Set to true to disable bold
--             no_underline = false,  -- Set to true to disable underline
--             styles = {          -- Configure styles for different highlight groups
--                 comments = { "italic" },
--                 conditionals = { "italic" },
--                 loops = {},
--                 functions = {},
--                 keywords = {},
--                 strings = {},
--                 variables = {},
--                 numbers = {},
--                 booleans = {},
--                 properties = {},
--                 types = {},
--                 operators = {},
--             },
--             color_overrides = {},
--             custom_highlights = {},
--             default_integrations = true,  -- Enable default integrations
--             integrations = {
--                 cmp = true,
--                 gitsigns = true,
--                 nvimtree = true,
--                 treesitter = true,
--                 notify = false,
--                 mini = {
--                     enabled = true,
--                     indentscope_color = "",
--                 },
--             },
--         })
--
--         -- Apply the Catppuccin colorscheme
--         vim.cmd([[colorscheme catppuccin]])
--     end,
--     -- (Optional) Add any additional options here
--     -- opts = { ... }
-- }
return {
    "folke/tokyonight.nvim",
    priority = 1000,  -- Ensure this plugin loads early
    config = function()
        -- Set the background to dark (or "light" for light mode)
        vim.o.background = "dark"

        -- Load and configure Tokyonight
        require("tokyonight").setup({
            style = "storm",  -- Options: "storm", "moon", "night", "day"
            transparent = true,  -- Enable transparency
            terminal_colors = true,  -- Set terminal colors
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "dark",  -- Style for sidebars: "dark", "transparent", or "normal"
                floats = "dark",    -- Style for floating windows
            },
            sidebars = { "qf", "help", "terminal", "packer" },  -- Which windows are sidebars
            hide_inactive_statusline = false,
            dim_inactive = false,
            lualine_bold = false,
        })

        -- Apply the Tokyonight colorscheme
        vim.cmd([[colorscheme tokyonight]])
    end,
    -- (Optional) Add additional options here
    -- opts = { ... }
}

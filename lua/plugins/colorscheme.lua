-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--         vim.o.background = "dark" -- or "light" for light mode
--         vim.cmd([[colorscheme gruvbox]])
--     end,
--     opts = ...
-- }
return {
    "rebelot/kanagawa.nvim",
    priority = 1000,  -- Ensure this plugin loads early
    config = function()
        -- Set the background to dark (or "light" for light mode)
        vim.o.background = "dark"

        -- Load and configure Kanagawa
        require("kanagawa").setup({
            -- (Optional) Add any custom configuration options here
            -- For example, you can specify the variant ("dragon", "wave", or "lotus")
            colorscheme = "kanagawa-dragon",  -- Use the "dragon" variant
        })

        -- Apply the Kanagawa colorscheme
        vim.cmd([[colorscheme kanagawa-dragon]])
    end,
    -- (Optional) Add any additional options here
    -- opts = { ... }
}

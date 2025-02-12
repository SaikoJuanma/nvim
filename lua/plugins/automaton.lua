return {
  {
    "Eandrju/cellular-automaton.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>wave", "<cmd>CellularAutomaton game_of_life<CR>", { noremap = true, silent = true })
    end,
    cmd = "CellularAutomaton", -- Carga el plugin solo cuando se usa el comando
    keys = {
      { "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it Rain" },
      { "<leader>wave", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of Life" }
    },
  },
}

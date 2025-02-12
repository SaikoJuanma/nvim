return {
  {
    "rachartier/tiny-glimmer.nvim",
    config = function()
      require("tiny-glimmer").setup({
        default_animation = "left_to_right", -- Puedes cambiar a "fade", "bounce", "pulse", "rainbow", etc. "left_to_right"
        transparency_color = "#000000", -- Ajusta este valor si usas un fondo transparente
      })
    end,
  },
}

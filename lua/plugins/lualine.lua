return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                theme = 'gruvbox_dark',
            },
            sections = {
                lualine_c = {
                    { 'filename', path = 2 } -- path = 2 muestra la ruta completa del archivo
                },
                lualine_x = {
                    'filetype', -- Muestra el tipo de lenguaje de código
                    {
                        function() return os.date("%H:%M") end, -- Muestra la hora en formato 24 horas (HH:MM)
                        icon = '🕒' -- Opcional: agrega un ícono de reloj
                    },
                },
            }
        })
    end
}

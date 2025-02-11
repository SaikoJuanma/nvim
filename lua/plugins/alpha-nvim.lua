-- ~/.config/nvim/lua/plugins/alpha-nvim.lua

return {
  'goolord/alpha-nvim',
  dependencies = {
    'catppuccin/nvim', -- For the mocha color palette
  },
  config = function()
    -- Helper functions for color manipulation
    local function hex_to_rgb(hex)
      hex = hex:gsub("#", "")
      return {
        r = tonumber(hex:sub(1, 2), 16),
        g = tonumber(hex:sub(3, 4), 16),
        b = tonumber(hex:sub(5, 6), 16),
      }
    end

    local function rgb_to_hex(rgb)
      return string.format("#%02x%02x%02x", rgb.r, rgb.g, rgb.b)
    end

    local function darken(hex, amount)
      local rgb = hex_to_rgb(hex)
      rgb.r = math.max(0, rgb.r * (1 - amount))
      rgb.g = math.max(0, rgb.g * (1 - amount))
      rgb.b = math.max(0, rgb.b * (1 - amount))
      return rgb_to_hex(rgb)
    end

    -- Function to calculate the length of a UTF-8 character
    local function getLen(str, start_pos)
      local byte = string.byte(str, start_pos)
      if not byte then
        return nil
      end
      return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
    end

    -- Function to colorize the header
    local function colorize(header, header_color_map, colors)
      for letter, color in pairs(colors) do
        local color_name = "AlphaJemuelKwelKwelWalangTatay" .. letter
        vim.api.nvim_set_hl(0, color_name, color)
        colors[letter] = color_name
      end

      local colorized = {}

      for i, line in ipairs(header_color_map) do
        local colorized_line = {}
        local pos = 0

        for j = 1, #line do
          local start = pos
          pos = pos + getLen(header[i], start + 1)

          local color_name = colors[line:sub(j, j)]
          if color_name then
            table.insert(colorized_line, { color_name, start, pos })
          end
        end

        table.insert(colorized, colorized_line)
      end

      return colorized
    end

    -- Main configuration
    local alpha = require("alpha")
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    local dashboard = require("alpha.themes.dashboard")

    -- Color map for the header
    local color_map = {
      [[      AAAA]],
      [[AAAAAA  AAAA]],
      [[AA    AAAA  AAAA        KKHHKKHHHH]],
      [[AAAA    AAAA  AA    HHBBKKKKKKKKKKKKKK]],
      [[  AAAAAA      AAKKBBHHKKBBYYBBKKKKHHKKKKKK]],
      [[      AAAA  BBAAKKHHBBBBKKKKBBYYBBHHHHKKKKKK]],
      [[        BBAABBKKYYYYHHKKYYYYKKKKBBBBBBZZZZZZ]],
      [[    YYBBYYBBKKYYYYYYYYYYKKKKBBKKAAAAZZOOZZZZ]],
      [[    XXXXYYYYBBYYYYYYYYBBBBBBKKKKBBBBAAAAZZZZ]],
      [[    XXXXUUUUYYYYBBYYYYYYBBKKBBZZOOAAZZOOAAAAAA]],
      [[  ZZZZZZXXUUXXXXYYYYYYYYBBAAAAZZOOOOAAOOZZZZAAAA]],
      [[  ZZUUZZXXUUUUXXXXUUXXFFFFFFFFAAAAOOZZAAZZZZ  AA]],
      [[    RRRRUUUUZZZZZZZZXXOOFFFFOOZZOOAAAAAAZZZZAA]],
      [[    CCSSUUUUZZXXXXZZXXOOFFFFOOZZOOOOZZOOAAAA]],
      [[    CCCCUUUUUUUUUURRRROOFFFFOOZZOOOOZZOOZZZZ]],
      [[    CCCCUUUUUUUUSSCCCCEEQQQQOOZZOOOOZZOOZZZZ]],
      [[    CCCCUUGGUUUUCCCCCCEEQQQQOOZZOOOOZZEEZZ]],
      [[    RRRRGGGGUUGGCCCCCCOOOOOOOOZZOOEEZZII]],
      [[      IIRRGGGGGGCCCCCCOOOOOOOOZZEEII]],
      [[            GGRRCCCCCCOOOOEEEEII  II]],
      [[                RRRRRREEEE  IIII]],
      [[                      II]],
      [[]],
    }

    -- Define colors
    local yellow = "#FAC87C"
    local orange = "#BF854E"
    local maroon = "#502E2B"
    local brown = "#38291B"
    local colors = {
      ["A"] = { fg = mocha.rosewater },
      ["Y"] = { fg = yellow },
      ["B"] = { fg = darken(yellow, 0.05) }, -- 5% darker
      ["X"] = { fg = darken(yellow, 0.20) }, -- 20% darker
      ["U"] = { fg = darken(yellow, 0.25) },
      ["F"] = { fg = darken(yellow, 0.35) },
      ["O"] = { fg = darken(yellow, 0.45) },
      ["K"] = { fg = maroon },
      ["H"] = { fg = darken(maroon, 0.10) },
      ["Z"] = { fg = mocha.crust },
      ["G"] = { fg = darken(yellow, 0.25) },
      ["R"] = { fg = orange },
      ["Q"] = { fg = darken(orange, 0.20) },
      ["E"] = { fg = darken(orange, 0.35) },
      ["I"] = { fg = brown },
      ["C"] = { fg = mocha.mantle },
      ["S"] = { fg = mocha.subtext1 },
    }

    -- Build the header
    local header = {}
    for _, line in ipairs(color_map) do
      local header_line = [[]]
      for i = 1, #line do
        if line:sub(i, i) ~= " " then
          header_line = header_line .. "█"
        else
          header_line = header_line .. " "
        end
      end
      table.insert(header, header_line)
    end

    -- Add the "NeoBee" text to the header
    local header_add = [[          N        E      O    B   E E         ]]
    table.insert(header, header_add)

    -- Highlight the "NeoBee" text
    local hl_add = {}
    for i = 1, #header_add do
      table.insert(hl_add, { "NeoBeeTitle", 1, i })
    end

    -- Set up the dashboard header
    dashboard.section.header.val = header
    local colorized = colorize(header, color_map, colors)
    table.insert(colorized, hl_add)

    dashboard.section.header.opts = {
      hl = colorized,
      position = "center",
    }

        -- Define dashboard buttons
        dashboard.section.buttons.val = {
            dashboard.button("󰇘", "  New file", "<Cmd>ene <CR>"),
            dashboard.button("󰇘", "  Find file", "<Cmd>Telescope find_files<CR>"),
            dashboard.button("󰇘", "  Neobee config", "<Cmd>Neotree reveal ~/.config/nvim<CR>"),
            dashboard.button("󰇘", "  Quit", "<Cmd>qa<CR>"),
            dashboard.button("󰇘", "  Update plugins", "<cmd>Lazy sync<CR>"), 
        }

    -- Configure button appearance
    for _, a in ipairs(dashboard.section.buttons.val) do
      a.opts.width = 49
      a.opts.cursor = -2
    end

    -- Apply the dashboard configuration
    alpha.setup(dashboard.config)
  end,
}

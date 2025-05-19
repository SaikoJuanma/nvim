return {
  'f-person/git-blame.nvim',
  config = function()
    -- Setup git-blame.nvim
    -- Using default configurations, but you can customize as needed
    require('gitblame').setup {
      -- Enable git blame by default
      enabled = true,
      
      -- Display git blame message in the virtual text
      virtual_text = true,
      
      -- Time in milliseconds to update the blame info
      delay = 1000,
      
      -- The message template
      message_template = '  <author> • <date> • <summary>',
      
      -- Date format in blame info
      date_format = '%Y-%m-%d %H:%M',
      
      -- Max message length
      message_max_length = 100
    }
  end
}

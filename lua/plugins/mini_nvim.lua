return{
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.ai').setup()
    require('mini.indentscope').setup()
    require('mini.diff').setup()
    require('mini.git').setup()
    require('mini.cursorword').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.jump').setup()
  end
}

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remaps for telescope functions
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

--remaps for neo-tree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})

--remaps to navigate between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- remaps to navigate tmux windows (same as nvim)
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>')
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<CR>')

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without formating
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- remap to replace words
vim.keymap.set('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>', opts)

-- telescope to find todo comments
vim.keymap.set('n', '<leader>td', ':TodoTelescope<CR>', opts);

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Remaps for split screen.
vim.api.nvim_set_keymap('n', '<C-z>', ':split<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-x>', ':vsplit<CR>', opts)

-- Remap to close windows
vim.api.nvim_set_keymap('n', '<C-y>', ':q<CR>', opts)

--remap for completions
local cmp = require("cmp")
local cmp_mappings = cmp.mapping.preset.insert({
   ["<C-b>"] = cmp.mapping.scroll_docs(-4),
   ["<C-f>"] = cmp.mapping.scroll_docs(4),
   ["<C-Space>"] = cmp.mapping.complete(),
   ["<C-q>"] = cmp.mapping.abort(),
   ["<CR>"] = cmp.mapping.confirm({ select = true }),
})

--remap to copy everything at once
vim.keymap.set('n', '<leader>ya', 'ggVGy<C-o>', opts)

--remaps for harpoon
local harpoon = require("harpoon")

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)
vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end)
vim.keymap.set('n', '<leader>6', function() harpoon:list():select(6) end)
vim.keymap.set('n', '<C-a>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<C-d>', function() harpoon:list():next() end)

--keymaps for lsp-config
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

-- Half page navigation
vim.keymap.set('n', '<C-u>', '15k', opts) -- half page up
vim.keymap.set('n', '<C-i>', '15j', opts) -- half page down

return {
   cmp_mappings = cmp_mappings,
}

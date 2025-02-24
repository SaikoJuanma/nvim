--line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--indentation format
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

--backups configs
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

--search configs
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

--scroll option
vim.opt.scrolloff = 8

--yank == copy pc
-- INFO: requires xclip to function
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Center screen when jumping between search results
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

-- Center screen after initiating search with '/' or '?'
vim.api.nvim_create_autocmd('CmdlineLeave', {
    pattern = { '/', '\\?' },
    callback = function()
        if vim.v.event.aborted == 0 then
            vim.cmd.normal({ 'zz', bang = true })
        end
    end,
})

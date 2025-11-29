vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 3
vim.o.title = true
vim.o.wildmenu = true
vim.o.showmode = false
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrap = false
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.signcolumn = "yes"
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set("n", "<Leader>w", ":w<CR>")
vim.keymap.set("n", "<Leader>q", ":q<CR>")
vim.keymap.set("n", "<Leader>t", ":tabnew<CR>")

vim.api.nvim_command('autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})')

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

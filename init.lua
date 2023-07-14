-------------------- INIT ----------------------------------
local fmt = string.format
local paq_dir = fmt('%s/site/pack/paqs/start/paq-nvim', vim.fn.stdpath('data'))

if vim.fn.empty(vim.fn.glob(paq_dir)) > 0 then
  vim.api.nvim_echo({{'Paq package manager is being installed'}}, false, {})
  vim.fn.system {'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', paq_dir}
  return
end

-------------------- PLUGINS -------------------------------
-- update plugins with :PaqSync
require 'paq' {
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},
  {'kylechui/nvim-surround'},
  {'lervag/vimtex'},
  {'savq/paq-nvim'},
  {'tpope/vim-fugitive'},
  {'easymotion/vim-easymotion'},
  {'zefei/vim-wintabs'},
  {'ycm-core/YouCompleteMe'},
  {'tpope/vim-commentary'},
}

-- open this config file
vim.keymap.set('n', 'gi', '<cmd>e ~/.config/nvim/init.lua<CR>')

-- fzf
vim.keymap.set('n', '<C-p>', '<cmd>Files<CR>')
vim.keymap.set('n', '<leader>*', function () return '<cmd>Rg ' .. vim.fn.expand("<cword>") .. '<CR>' end, { expr = true })

-- easymotion
vim.keymap.set('n', '/', '<Plug>(easymotion-sn)')
vim.keymap.set('o', '/', '<Plug>(easymotion-sn)')
vim.keymap.set('n', 'f', '<Plug>(easymotion-bd-f)')

-- buffers
vim.keymap.set('n', 'gj', '<cmd>bp<CR>')
vim.keymap.set('n', 'gk', '<cmd>bn<CR>')
vim.keymap.set('n', '<C-c>', ':bp|bd #<CR>')
vim.keymap.set('n', 'gl', '<cmd>ls<CR>:b ')

-------------------- OPTIONS -------------------------------
local indent = 8
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.mouse = ''
--vim.opt.nohlsearch = true
vim.opt.scrolloff = 20
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

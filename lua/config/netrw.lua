-- hide the banner
vim.g.netrw_banner = 0

-- tree style listing
vim.g.netrw_liststyle = 3

-- options for netwr buffer
vim.g.netrw_bufsettings = 'number relativenumber'

vim.keymap.set('n', '<leader>ex', '<cmd>Ex<CR>')
vim.keymap.set('n', '<leader>ve', '<cmd>Sex!<CR>')

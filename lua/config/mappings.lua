local noarrows = true

-- Leader keys
vim.keymap.set('n', '<leader>l', '<cmd>Lazy home<CR>', { desc = 'Open Lazy main menu' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete to the void register' })
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Substitute word under cursor' })
vim.keymap.set('n', '<leader>cs', '<cmd>nohlsearch<CR>', { desc = 'Substitute word under cursor' })
vim.keymap.set('n', '<leader>o', 'o<esc>kO<Esc>j', { desc = 'Add empty lines' })

-- Buffer switching
vim.keymap.set('n', 'gn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', 'gp', '<cmd>bprev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', 'gd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

-- Improved J
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join line with next' })

-- Improved scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Improved next match
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

-- Stuff for convenience
vim.keymap.set('n', '<C-Return>', 'o<Esc>', { desc = 'New line at end' })
vim.keymap.set('n', '<C-,>', 'A,<Esc>', { desc = 'Comma at end' })
vim.keymap.set('n', '==', 'gg=G', { desc = 'Reindent file' })

-- Window management remaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to below window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to above window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })

vim.keymap.set('n', '<C-S-h>', '<cmd>vertical resize +6<CR>', { desc = 'Resize window left' })
vim.keymap.set('n', '<C-S-j>', '<cmd>resize +3<CR>', { desc = 'Resize window down' })
vim.keymap.set('n', '<C-S-k>', '<cmd>resize -3<CR>', { desc = 'Resize window up' })
vim.keymap.set('n', '<C-S-l>', '<cmd>vertical resize -6<CR>', { desc = 'Resize window right' })

-- Visual mode stuff
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move line down' })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move line up' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete to the void register' })

-- Quick insert mode leaving
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Escape insert mode' })

if noarrows == true then
  local skillissue = function()
    print("skill issue?")
  end

  vim.keymap.set('n', '<Up>', skillissue, { desc = 'No arrow keys'})
  vim.keymap.set('n', '<Down>', skillissue, { desc = 'No arrow keys'})
  vim.keymap.set('n', '<Left>', skillissue, { desc = 'No arrow keys'})
  vim.keymap.set('n', '<Right>', skillissue, { desc = 'No arrow keys'})
end

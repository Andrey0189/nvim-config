local wk = require('which-key')
local noarrows = true

wk.register({
  ['<leader>'] = {
    l = { '<cmd>Lazy home<CR>', 'Open Lazy main menu' },
    y = { '"*y', 'Yank to system clipboard' },
    Y = { '"*Y', 'Yank line to system clipboard' },
    s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Substitute word under cursor' },
  },

  ['<C-S-h>'] = { '<cmd>vertical resize +6<CR>', 'Resize window left' },
  ['<C-S-j>'] = { '<cmd>resize +3<CR>', 'Resize window down' },
  ['<C-S-k>'] = { '<cmd>resize -3<CR>', 'Resize window up' },
  ['<C-S-l>'] = { '<cmd>vertical resize -6<CR>', 'Resize window right' },

  J = { 'mzJ`z', 'Join line with next' },

  ['<C-d>'] = { '<C-d>zz', 'Scroll down and center' },
  ['<C-u>'] = { '<C-u>zz', 'Scroll up and center' },

  n = { 'nzzzv', 'Next search result and center' },
  N = { 'Nzzzv', 'Previous search result and center' },

  ['<C-Return>'] = { '$a<CR><Esc>', 'New line at end' },
  ['<C-,>'] = { '$a,<Esc>', 'Comma at end' },

  ['=='] = { 'gg=G', 'Reindent file' },

  ['<C-h>'] = { '<C-w><C-h>', 'Move to left window' },
  ['<C-j>'] = { '<C-w><C-j>', 'Move to below window' },
  ['<C-k>'] = { '<C-w><C-k>', 'Move to above window' },
  ['<C-l>'] = { '<C-w><C-l>', 'Move to right window' },

}, { mode = 'n' })

wk.register({
  ['J'] = { ':m \'>+1<CR>gv=gv', 'Move line down' },
  ['K'] = { ':m \'<-2<CR>gv=gv', 'Move line up' },

  ['<leader>y'] = { '"*y', 'Yank to system clipboard' },
}, { mode = 'v' })

wk.register({
  ['jj'] = { '<Esc>', 'Escape insert mode' },
  ['<Esc>'] = { '<Nop>', 'Get used to jj' }
}, { mode = 'i' })

wk.register({
  ['<leader>p'] = { '"_dP', 'Paste and copy to void register' },
}, { mode = 'x' })


if noarrows == true then
  local skillissue = function()
    print("skill issue?")
  end

  local arrowRemap = {
    ['<Up>'] = { skillissue, 'No arrow keys'},
    ['<Down>'] = { skillissue, 'No arrow keys'},
    ['<Left>'] = { skillissue, 'No arrow keys'},
    ['<Right>'] = { skillissue, 'No arrow keys'},
  }

  wk.register(arrowRemap, { mode = 'n' })
  wk.register(arrowRemap, { mode = 'v' })
  wk.register(arrowRemap, { mode = 'i' })
end

-- Autosource for config files
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.stdpath('config') .. '/**/*.lua',
  callback = function()
    vim.cmd('source %')
  end,
})

-- Enable wrap for *.md + smart kj
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.keymap.set('n', 'k', 'gk', { desc = 'Go up one line even if it is wrapped' })
    vim.keymap.set('n', 'j', 'gj', { desc = 'Go down one line even if it is wrapped' })
  end,
})

-- Trim trailing white spaces on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    -- Save the cursor position
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    -- Remove trailing white spaces
    vim.cmd([[%s/\s\+$//e]])
    -- Restore the cursor position
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end
})

-- Enable cursorline when entering a window
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  callback = function()
    vim.wo.cursorline = true
  end,
})

-- Disable cursorline when leaving a window
vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  callback = function()
    vim.wo.cursorline = false
  end,
})

-- Help window is vertical
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = { '*.txt' },
  callback = function()
    if vim.bo.filetype == 'help' then
      vim.cmd.wincmd('L')
    end
  end,
})

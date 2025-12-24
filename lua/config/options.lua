vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local options = {
  -- Clipboard settings
  clipboard = 'unnamedplus', -- Use system clipboard

  -- Line numbering
  number = true, -- Show line numbers
  relativenumber = true, -- Show relative line numbers

  -- Backup and swap files
  swapfile = false, -- Disable swap file
  backup = false, -- Disable backup file

  -- Text wrapping and scrolling
  wrap = false, -- Disable line wrapping
  smoothscroll = true, -- Enable smooth scrolling
  scrolloff = 8, -- Minimum number of screen lines to keep above and below the cursor

  -- Mouse and cursor settings
  mouse = '', -- Disable mouse support
  guicursor = '', -- Disable GUI cursor

  -- Splitting behavior
  splitright = true, -- Split vertical window to the right

  -- Indentation and tab settings
  expandtab = true, -- Use spaces instead of tabs
  smartindent = true, -- Smart autoindenting on new lines
  cindent = true, -- Enable C-style indentation
  smarttab = true, -- Insert appropriate number of spaces on tab
  shiftwidth = 2, -- Number of spaces to use for each step of (auto)indent
  tabstop = 2, -- Number of spaces that a <Tab> in the file counts for

  -- Search settings
  hlsearch = true, -- Enable highlight on search
  incsearch = true, -- Show search matches as you type

  -- Visual settings
  termguicolors = true, -- Enable true color support
  cursorline = true, -- Highlight the current line

  -- Performance settings
  updatetime = 50, -- Faster completion (default is 4000ms)

  -- Hide syntax markers in JSON and Markdown files
  cole = 2,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

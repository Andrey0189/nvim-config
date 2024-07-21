return {
  'nvim-lualine/lualine.nvim',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        -- fmt = string.lower,
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        -- Filetypes to disable lualine for.
        disabled_filetypes = {
          -- only ignores the ft for statusline.
          statusline = {},
          -- only ignores the ft for winbar.
          winbar = {},
        },
        -- make statusline inactive for following data types
        ignore_focus = {},
        -- a b c won't take the entire statusline
        always_divide_middle = true,
        -- if set to false every widnow will have its own statusnbar
        globalstatus = true,
        -- refresh time in ms
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          { 'mode',
            -- component specific options
            -- icons_enabled = true, -- Enables the display of icons alongside the component.
            -- icon = nil,
            -- custom separators for component
            -- separator = { left = '', right = ''}
          }
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- Date
        -- lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" },
        lualine_c = {
          {
            -- 'buffers',
            'filename',
          }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      -- I have no idea what it is needed for
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {'location'},
      --   lualine_y = {},
      --   lualine_z = {}
      -- },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}

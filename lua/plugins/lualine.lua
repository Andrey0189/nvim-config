return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'gruvbox-material',
        -- Use separators for a cleaner look
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'neo-tree' } },
      },
      sections = {
        lualine_a = { { 'mode', right_padding = 2 } },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } }, -- path = 1 shows relative path
        lualine_x = {
          {
            -- Function to show active LSP server name
            function()
              local buf_ft = vim.api.nvim_get_current_buf_option(0, 'filetype')
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return 'No LSP'
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return 'No LSP'
            end,
            icon = ' ',
            color = { fg = '#ffffff', gui = 'bold' },
          },
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end,
}

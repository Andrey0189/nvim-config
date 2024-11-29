return {
  'williamboman/mason.nvim',
  enabled = false,
  config = function ()
    -- Initialize the mason plugin, which manages installation of LSP servers and other tools
    require('mason').setup()
    -- Initialize mason-lspconfig plugin, which bridges mason and nvim-lspconfig
    require('mason-lspconfig').setup({
      handlers = {
        -- Handler function to set up each LSP server
        function(server_name)
          -- Set up the LSP server using nvim-lspconfig with the specified capabilities
          require('lspconfig')[server_name].setup({
            capabilities = capabilities
          })
        end,

        ['lua_ls'] = function ()
          require('lspconfig').lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
                }
              }
            }
          })
        end
      }
    })

    vim.keymap.set('n', '<C-m>', '<cmd>Mason<cr>', { desc = 'Run Mason' })
  end
}

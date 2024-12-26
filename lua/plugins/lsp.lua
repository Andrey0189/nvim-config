return {
  -- Neovim built-in LSP configuration
  'neovim/nvim-lspconfig',
  enabled = true,
  lazy = false,
  dependencies = {
    -- Mason LSPconfig: Extension to mason.nvim to automatically set up LSP servers
    'williamboman/mason-lspconfig.nvim',

    -- Nvim-cmp: A completion engine plugin for Neovim written in Lua
    'hrsh7th/nvim-cmp',

    -- nvim-cmp source for LSP
    'hrsh7th/cmp-nvim-lsp',

    -- nvim-cmp source for buffer words
    'hrsh7th/cmp-buffer',

    -- nvim-cmp source for filesystem paths
    'hrsh7th/cmp-path',

    -- nvim-cmp source for Neovim's command-line
    'hrsh7th/cmp-cmdline',

    -- LuaSnip: A snippet engine for Neovim written in Lua
    'L3MON4D3/LuaSnip',

    -- nvim-cmp source for LuaSnip
    'saadparwaiz1/cmp_luasnip',

    -- Fidget: Standalone UI for nvim-lsp progress. Eye candy for the impatient.
    'j-hui/fidget.nvim',

    -- lspkind for awesome icons
    'onsails/lspkind.nvim'
  },

  config = function ()
    require('fidget').setup({})
    local cmp = require('cmp')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    local lspconfig = require('lspconfig')

    local capabilities = vim.tbl_deep_extend(
      'force',  -- Use 'force' to overwrite conflicting keys
      {},  -- Start with an empty table
      vim.lsp.protocol.make_client_capabilities(),  -- Default LSP client capabilities
      cmp_nvim_lsp.default_capabilities()  -- Capabilities required for nvim-cmp
    )

    lspconfig.lua_ls.setup({
      cmd = { "lua-language-server" },
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
        },
      },
    })

    lspconfig.nixd.setup({
      cmd = { "nixd" },
      capabilities = capabilities,
    })

    lspconfig.pylsp.setup({
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'W391'},
              maxLineLength = 100
            }
          }
        }
      }
    })

    -- Setup completion configuration for nvim-cmp
    cmp.setup({
      snippet = {
        expand = function (args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        -- Mapping for triggering completion
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Mapping for scrolling documentation upwards
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        -- Mapping for scrolling documentation downwards
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- Mapping for closing completion window
        ['<C-e>'] = cmp.mapping.close(),
        -- Mapping for confirming selection with Enter key
        -- ['<CR>'] = cmp.mapping.confirm {
        --   behavior = cmp.ConfirmBehavior.Replace,
        --   select = true,
        -- },
        -- Mapping for selecting next item in completion menu with Tab
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- Mapping for selecting previous item in completion menu with Shift+Tab
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = cmp.config.sources({
        -- Set source for LSP
        { name = 'nvim_lsp' },
        -- Set source for file paths
        { name = 'path' },
        -- Set source for LuaSnip snippets
        { name = 'luasnip' }
      }, {
          -- If cmp haven't found anything in the first table, it goes to this one
          { name = 'buffer' },
        }),

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
        })
      },

      experimental = {
        ghost_text = true
      }
    })

    -- Setup completion configuration for search command-line mode
    cmp.setup.cmdline({ '?', '/' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        -- Set source for buffer words
        { name = 'buffer' }
      }
    })

    -- Setup completion configuration for command-line mode
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        -- Set source for file paths
        { name = 'path' }
      }, {
          -- Set source for command-line commands
          { name = 'cmdline' }
        }),
      -- Allow non-prefix matching for symbols
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Create a capabilities table by deeply merging several tables
    -- This ensures that the LSP client capabilities are extended with nvim-cmp capabilities


    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { desc = "Hover" })
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace symbol" })
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, { desc = "Open diagnostic float" })
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, { desc = "Code action" })
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, { desc = "References" })
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, { desc = "Rename" })
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
  end
}

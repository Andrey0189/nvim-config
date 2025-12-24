return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      -- Add support for Hyprland configuration files
      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" }
      })

      require('nvim-treesitter.configs').setup({
        modules = {},
        sync_install = false,
        ignore_install = {},

        ensure_installed = {
          'c',
          'lua',
          'vim',
          'vimdoc',
          'query',
          'markdown',
          'markdown_inline',
          'python',
          'javascript',
          'typescript',
          'bash',
          'go',
          'rust',
          'html',
          'css',
        },

        auto_install = true,

        highlight = {
          enable = true,
          -- disable highlighting for large files
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 kb
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },

        indent = {
          enable = true
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'Select outer part of a function' },
              ['if'] = { query = '@function.inner', desc = 'Select inner part of a function' },
              ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
              ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
      })
    end
  },
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    enable = false,
    build = ':TSUpdate',
    lazy = false,
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    config = function()
      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" }
      })
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c',
          'lua',
          'vim',
          'vimdoc',
          'query',
          'markdown',
          'markdown_inline'
        },

        auto_install = true,

        highlight = {
          enable = true,
          -- disable highlighting for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 kb
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
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
      })
    end
  },
}

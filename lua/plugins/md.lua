return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- Heading icons for a more visual hierarchy
    heading = {
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    -- Use the Obsidian preset to avoid UI conflicts with obsidian.nvim
    preset = 'obsidian',
  },
}

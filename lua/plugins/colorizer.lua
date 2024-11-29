return {
  'norcalli/nvim-colorizer.lua',
  -- config = function()
  --   require('colorizer').setup({
  --     '*';
  --     user_default_options = {
  --       names = false,
  --       mode = 'foreground'
  --     }
  --   })
  -- end
  opts = {
    '*';
    user_default_options = {
      names = false,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    }
  }
}

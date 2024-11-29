return {
  "vimwiki/vimwiki",
  enabled = false,
  event = "BufEnter *.md",
  keys = { "<leader>ww", "<leader>wt" },
  init = function()
    -- vim.g.vimwiki_list = {
    --   {
    --     path = "~/vimwiki/",
    --     syntax = "markdown",
    --     ext = "md",
    --   },
    -- }
    -- vim.g.vimwiki_ext2syntax = { }
  end,
}

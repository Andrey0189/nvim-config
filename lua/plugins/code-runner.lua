return {
  'CRAG666/code_runner.nvim',
  config = function ()
    require('code_runner').setup({
      filetype = {
        python = "python -u",
        javascript = "node",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
      }
    })

    -- Save and run the current code based on filetype configuration
    vim.keymap.set('n', '<leader>r', ':w | RunCode<CR>', { noremap = true, silent = false })
    -- Run the current file
    vim.keymap.set('n', '<leader>rf', ':w | RunFile<CR>', { noremap = true, silent = false })
    -- Run the current file in a new Neovim tab
    vim.keymap.set('n', '<leader>rft', ':w | RunFile tab<CR>', { noremap = true, silent = false })
    -- Run the project (requires project configuration in code_runner)
    vim.keymap.set('n', '<leader>rp', ':w | RunProject<CR>', { noremap = true, silent = false })
    -- Close the runner output window
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    -- Open the UI to manage/view filetype-specific runner configurations
    vim.keymap.set('n', '<leader>crf', ':w | CRFiletype<CR>', { noremap = true, silent = false })
    -- Open the UI to manage/view project-specific runner configurations
    vim.keymap.set('n', '<leader>crp', ':w | CRProjects<CR>', { noremap = true, silent = false })
  end
}

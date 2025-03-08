return {
  "nvim-telescope/telescope.nvim",

  dependencies = {"nvim-lua/plenary.nvim"},

  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup{
      defaults = {
        mappings = {
          i = {
            ["<C-l>"] = actions.close,
            ["<esc>"] = actions.close,
            ["<M-j>"] = actions.move_selection_next,
            ["<M-k>"] = actions.move_selection_previous,
          },
        },
      }
    }
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fG', builtin.git_files, {})
    --vim.keymap.set('n', '<leader>fG', function()
    --  local word = vim.fn.expand("<cword>")
    --  builtin.grep_string({ search = word });
    --end)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
    vim.keymap.set('n', '<leader>H', builtin.help_tags)
  end,
}

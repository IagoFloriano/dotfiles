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
    vim.keymap.set('n', '<C-f>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fG', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep)
  end,
}

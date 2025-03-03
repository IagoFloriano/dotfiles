return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  {
    "dracula/vim",
    name = "dracula",
    config = function ()
      vim.cmd.colorscheme("dracula")

      vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function ()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
    end,
  },
}

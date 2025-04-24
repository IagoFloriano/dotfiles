return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  {
    "dracula/vim",
    name = "dracula",
    config = function()
      vim.cmd.colorscheme("dracula")

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "habamax/vim-godot",
    event = "BufEnter *.gd",
    config = function()
      -- local null_ls = require("null-ls")
      -- null_ls.register({
      --   -- gdlint didn't work
      --   -- null_ls.builtins.diagnostics.gdlint,
      --   null_ls.builtins.formatting.gdformat,
      -- })

      vim.opt.tabstop = 2
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
    end,
  },
}

return {
 "Yggdroot/indentLine",
  config = function()
    vim.g.indentLine_char_list = {"▏","|", "¦", "┆", "┊"}
    vim.keymap.set('n', '<leader>|', ':IndentLinesToggle<CR>')
  end,
}

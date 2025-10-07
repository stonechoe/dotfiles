return {
  'Mofiqul/vscode.nvim',
  priority = 9999,
  lazy = false,
  config = function()
    vim.cmd("colorscheme vscode")
  end
}

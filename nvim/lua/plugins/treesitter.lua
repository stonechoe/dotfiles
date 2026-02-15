return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    local configs = require "nvim-treesitter.config"

    configs.setup {
      ensure_installed = {
        "c",
        "lua",
        "gitignore",
        "gitcommit",
        "html",
        "css",
        "rust",
        "go",
        "javascript",
        "typescript",
        "markdown",
        "scala",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}

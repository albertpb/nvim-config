return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    require("nvim-ts-autotag").setup()

    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "nix",
        "javascript",
        "typescript",
        "tsx",
        "sql",
        "rust",
        "go",
        "python",
        "json",
        "html",
        "markdown",
        "markdown_inline",
        "yaml",
        "toml",
        "terraform",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- javascript
        null_ls.builtins.formatting.prettier,
        require("none-ls.formatting.eslint_d"),
        -- python
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

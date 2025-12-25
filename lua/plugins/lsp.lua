return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('nil_ls')
    vim.lsp.enable('gopls')
    vim.lsp.enable('ts_ls')

    vim.lsp.config('nil_ls', {
      ['nil'] = {
        formatting = {
          command = "nixfmt",
        },
      }
    })

    local map = vim.keymap.set
    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    map("n", "gsd", function()
      vim.cmd("split")
      vim.lsp.buf.definition()
    end, { desc = "Definition (horizontal split)" })

    map("n", "gvd", function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
    end, { desc = "Definition (vertical split)" })

    -- Declaration
    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

    -- Implementation
    map("n", "gsi", function()
      vim.cmd("split")
      vim.lsp.buf.implementation()
    end, { desc = "Implementation (horizontal split)" })

    map("n", "gvi", function()
      vim.cmd("vsplit")
      vim.lsp.buf.implementation()
    end, { desc = "Implementation (vertical split)" })
  end,
}

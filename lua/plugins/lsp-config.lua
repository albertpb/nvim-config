return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.set_preferences({
        call_servers = "global",
      })

      lsp_zero.setup_servers({
        "lua_ls",
        "nil_ls",
        "tsserver",
        "marksman",
        "emmet_ls",
        "tailwindcss",
        "terraformls",
        "yamlls",
      })

      lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
      })

      local function on_attach(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end

      lsp_zero.on_attach(on_attach)

      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.nil_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.marksman.setup({})
      lspconfig.emmet_ls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.terraformls.setup({})
      lspconfig.yamlls.setup({})
    end,
    dependencies = { "neovim/nvim-lspconfig" },
  },
}

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.set_preferences({
        call_servers = "global",
      })

      lsp_zero.configure("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            runtime = { version = 'LuaJIT' },
            telemetry = { enable = false },
          },
        },
      })

      lsp_zero.setup_servers({
        "lua_ls",
        "nil_ls"
      })

      local function on_attach(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end

      lsp_zero.on_attach(on_attach)

      lsp_zero.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
        }
      })

      lsp_zero.setup()
      vim.diagnostic.config({})

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.nil_ls.setup({})
    end,
    dependencies = { "neovim/nvim-lspconfig" }
  },
}

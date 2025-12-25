return {
  "gbprod/yanky.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },

  opts = {
    ring = {
      history_length = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
      cancel_event = "update",
      ignore_registers = { "_" },
      update_register_on_cycle = false,
    },
    picker = {
      telescope = {
        use_default_mappings = true,
      },
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 500,
    },
    preserve_cursor_position = {
      enabled = true,
    },
  },

  keys = {
    { "<leader>y", "<cmd>Telescope yank_history<cr>", desc = "Yank history (Telescope)" },
  },

  config = function(_, opts)
    require("yanky").setup(opts)
    require("telescope").load_extension("yank_history")
  end,
}

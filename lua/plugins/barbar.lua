return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' }
    }
  },
  version = '^1.0.0',
  event = "VeryLazy",
  keys = {
    {
      "<C-x>",
      "<Cmd>BufferClose<CR>",
      mode = "n",
      desc = "Close buffer"
    },
  },
}

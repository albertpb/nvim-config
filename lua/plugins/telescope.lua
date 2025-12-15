return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope.builtin")
			local telescope_last = 0
			local telescope_resume = function()
				if telescope_last == 0 then
					telescope_last = 1
					telescope.live_grep()
				else
					telescope.resume()
				end
			end

			vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "live grep" })
		  vim.keymap.set("n", "<leader>fd", telescope.diagnostics, {})
      vim.keymap.set("n", "<leader>fb", telescope.buffers, {})
      vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "find files" })
      vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "help tags" })
    end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

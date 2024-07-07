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

			vim.keymap.set("n", "<C-p>", telescope.find_files, {})
			vim.keymap.set("n", "<leader>fg", telescope_resume, {})
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

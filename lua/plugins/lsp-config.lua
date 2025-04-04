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
				"eslint",
				"ts_ls",
				"marksman",
				"emmet_ls",
				"tailwindcss",
				"terraformls",
				"yamlls",
				"jdtls",
				"stylelint_lsp",
			})

			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})

			local function on_attach(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
				vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
				vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

				vim.keymap.set({ "n", "x" }, "<F3>", function()
					-- vim.lsp.buf.format({ async = false, timeout_ms = 15000 })
					require("conform").format({ bufnr })
				end, opts)
			end

			lsp_zero.on_attach(on_attach)

			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

			local lspconfig = require("lspconfig")

			local working_dir = function()
				return vim.fs.dirname(
					vim.fs.find({ "gradlew", ".gradlew", ".gitignore", "mvnw", "build.grade.kts" }, { upward = true })[1]
				)
			end

			-- print(vim.inspect(working_dir()))

			lspconfig.lua_ls.setup({})
			lspconfig.html.setup({})
			lspconfig.nil_ls.setup({})
			lspconfig.eslint.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.emmet_ls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.terraformls.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.jdtls.setup({
				cmd = {
					"jdt-language-server",
					"-data",
					working_dir(),
				},
				root_dir = working_dir,
			})
		end,
		dependencies = { "neovim/nvim-lspconfig" },
	},
}

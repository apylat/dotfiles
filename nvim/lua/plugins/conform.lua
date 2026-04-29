return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)

			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({
					async = false,
					lsp_fallback = true,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range" })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "typescriptreact", "javascriptreact" },
				callback = function(args)
					vim.keymap.set("n", "==", function()
						require("conform").format({
							async = false,
							lsp_fallback = true,
							timeout_ms = 1000,
						})
					end, { buffer = args.buf, desc = "Format buffer" })
				end,
			})
		end,
	},
}

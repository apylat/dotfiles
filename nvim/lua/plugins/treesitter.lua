return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = {
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
				disable = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"tsx",
				},
			},
		},
	},
}

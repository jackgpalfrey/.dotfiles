-- See all formatters at https://github.com/stevearc/conform.nvim#formatters
-- For config formatter config examples see:
-- https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters

return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			async = true,
			lsp_fallback = true,
		},
	},
}

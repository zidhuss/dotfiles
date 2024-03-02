return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				python = { "ruff_fix", "ruff_format" },

				javascript = { { "biome", "prettier" } },
				javascriptreact = { { "biome", "prettier" } },
				typescript = { { "biome", "prettier" } },
				typescriptreact = { { "biome", "prettier" } },
				json = { "fixjson", { "biome", "prettier" } },
				-- jsonc = { "fixjson" },

				html = { "prettier" },
				htmldjango = { "djlint" },

				css = { "prettier" },
				scss = { "prettier" },

				lua = { "stylua" },

				ruby = { "rubocop" },

				nix = { "alejandra" },

				terraform = { "tofu_fmt" },
				tf = { "tofu_fmt" },
				["terraform-vars"] = { "tofu_fmt" },

				go = { "goimports", "gofmt" },

				sql = { "pg_format" },
				pgsql = { "pg_format" },

				c = { "clang_format" },
				cpp = { "clang_format" },
				cs = { "clang_format" },
				cuda = { "clang_format" },
				proto = { "clang_format" },

				["_"] = { "trim_newlines", "trim_whitespace" },
			},
		},
	},
}

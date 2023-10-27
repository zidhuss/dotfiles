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

				javascript = { "biome" },
				javascriptreact = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				json = { "biome" },

				html = { "prettier" },

				lua = { "stylua" },

				ruby = { "rubocop" },

				nix = { "alejandra" },

				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },

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

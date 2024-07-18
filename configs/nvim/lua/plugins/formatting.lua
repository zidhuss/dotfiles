return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,

			formatters_by_ft = {
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

		config = function(_, opts)
			require("conform").setup(opts)

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
					vim.notify("Autoformat disabled for this buffer", vim.log.levels.INFO, { title = "Conform" })
				else
					vim.g.disable_autoformat = true
					vim.notify("Autoformat disabled", vim.log.levels.INFO, { title = "Conform" })
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
				vim.notify("Autoformat enabled", vim.log.levels.INFO, { title = "Conform" })
			end, {
				desc = "Re-enable autoformat-on-save",
			})

			vim.api.nvim_create_user_command("FormatToggle", function()
				if vim.b.disable_autoformat or vim.g.disable_autoformat then
					vim.cmd("FormatEnable")
				else
					vim.cmd("FormatDisable")
				end
			end, {
				desc = "Toggle autoformat-on-save",
			})
		end,
	},
}

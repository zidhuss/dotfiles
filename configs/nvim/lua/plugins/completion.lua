return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"petertriho/cmp-git",
			"ray-x/cmp-treesitter",
			"onsails/lspkind.nvim",
			-- snippets
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		cmd = { "CmpStatus" },
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
				window = {
					completion = {
						col_offset = -3,
						side_padding = 0,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },

					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({
							maxwidth = 50,
						})(entry, vim_item)

						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},

				mapping = {
					["<C-n>"] = { i = cmp.mapping.select_next_item() },
					["<C-p>"] = { i = cmp.mapping.select_prev_item() },
					["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					["<Tab>"] = vim.schedule_wrap(function(fallback)
						if cmp.visible() and has_words_before() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end),
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "emoji" },
					{ name = "treesitter" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "git" },
					{
						name = "lazydev",
						group_index = 0, -- set group index to 0 to skip loading LuaLS completions
					},
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "treesitter" },
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "cmdline" },
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done({
					filetypes = { tex = false },
				})
			)

			require("cmp_git").setup()
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot" },
		event = "InsertEnter",
		opts = {
			filetypes = {
				markdown = true,
				gitcommit = true,
				gitrebase = true,
			},
			method = "getCompletionsCycling",
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<c-y>",
					next = "<c-n>",
					prev = "<c-p>",
					dismiss = "<c-e>",
					accept_word = "<c-m>",
					accept_line = "<c-]>",
				},
			},
			panel = { enabled = false },
		},
	},
}

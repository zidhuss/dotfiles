return {
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,

		dependencies = {
			-- "nvim-treesitter/nvim-treesitter-context",
			-- "nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = function()
			local languages = {
				"astro",
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"comment",
				"cpp",
				"css",
				"dart",
				"diff",
				"dockerfile",
				"editorconfig",
				"elixir",
				"erlang",
				"fish",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"glsl",
				"go",
				"gomod",
				"gotmpl",
				"graphql",
				"haskell",
				"hcl",
				"helm",
				"hjson",
				"html",
				"htmldjango",
				"ini",
				"java",
				"javadoc",
				"javascript",
				"jq",
				"jsdoc",
				"json",
				"json5",
				"jsonnet",
				"just",
				"kotlin",
				"latex",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"nginx",
				"nix",
				"php",
				"phpdoc",
				"promql",
				"proto",
				"python",
				"ruby",
				"rust",
				"scss",
				"sql",
				"ssh_config",
				"swift",
				"toml",
				"typescript",
				"typst",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
				"zsh",
			}

			require("nvim-treesitter").install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter.setup", {}),
				callback = function(args)
					local buf = args.buf
					local filetype = args.match

					-- you need some mechanism to avoid running on buffers that do not
					-- correspond to a language (like oil.nvim buffers), this implementation
					-- checks if a parser exists for the current language
					local language = vim.treesitter.language.get_lang(filetype) or filetype
					if not vim.treesitter.language.add(language) then
						return
					end

					-- replicate `highlight = { enable = true }`
					vim.treesitter.start(buf, language)

					-- replicate `indent = { enable = true }`
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
		keys = {
			{
				"[g",
				function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end,
				desc = "jump to previous context",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					include_surrounding_whitespace = false,
				},
				move = {
					set_jumps = true,
				},
			})

			-- Select
			vim.keymap.set({ "x", "o" }, "am", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "im", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)

			-- Swap
			vim.keymap.set("n", "<leader>a", function()
				require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
			end)
			vim.keymap.set("n", "<leader>A", function()
				require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
			end)

			-- Move
			vim.keymap.set({ "n", "x", "o" }, "]m", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]]", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
			end)
			-- You can also pass a list to group multiple queries.
			vim.keymap.set({ "n", "x", "o" }, "]o", function()
				require("nvim-treesitter-textobjects.move").goto_next_start(
					{ "@loop.inner", "@loop.outer" },
					"textobjects"
				)
			end)
			vim.keymap.set({ "n", "x", "o" }, "]z", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
			end)

			vim.keymap.set({ "n", "x", "o" }, "]M", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "][", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "[m", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[[", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "[M", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[]", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
			end)

			-- Go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			vim.keymap.set({ "n", "x", "o" }, "]d", function()
				require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[d", function()
				require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
			end)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"andymass/vim-matchup",
		opts = {
			treesitter = {
				stopline = 500,
			},
		},
	},
	{
		"RRethy/nvim-treesitter-endwise",
		ft = { "ruby", "lua", "vimscript", "bash", "elixir" },
	},
	{ "windwp/nvim-ts-autotag", opts = {} },

	{
		"axelvc/template-string.nvim",
		ft = { "javascript", "typescript", "typescriptreact" },
		event = "InsertEnter",
		opts = {},
	},
	{
		"Wansmer/treesj",
		lazy = true,
		keys = {
			{
				"<space>j",
				function()
					require("treesj").toggle()
				end,
				desc = "toggle split/join",
			},
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
		},
	},
}

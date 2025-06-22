local java_filetypes = { "java" }
return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "folke/which-key.nvim" },
		ft = java_filetypes,
		opts = function()
			return {
				root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

				-- How to run jdtls. This can be overridden to a full java command-line
				-- if the Python wrapper script doesn't suffice.
				cmd = {
					vim.fn.exepath("jdtls"),
				},
			}
		end,
		config = function(_, opts)
			local function attach_jdtls()
				require("jdtls").start_or_attach(opts)
			end

			-- Attach the jdtls for each java buffer. HOWEVER, this plugin loads
			-- depending on filetype, so this autocmd doesn't run for the first file.
			-- For that, we call directly below.
			vim.api.nvim_create_autocmd("FileType", {
				pattern = java_filetypes,
				callback = attach_jdtls,
			})

			-- https://neovim.io/doc/user/lsp.html#LspAttach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local wk = require("which-key")
					if client and client.name == "jdtls" then
						wk.add({
							{
								mode = "n",
								buffer = args.buf,
								{ "<leader>cx", group = "extract" },
								{ "<leader>cxv", require("jdtls").extract_variable_all, desc = "Extract Variable" },
								{ "<leader>cxc", require("jdtls").extract_constant, desc = "Extract Constant" },
								{ "<leader>cgs", require("jdtls").super_implementation, desc = "Goto Super" },
								{ "<leader>cgS", require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
								{ "<leader>co", require("jdtls").organize_imports, desc = "Organize Imports" },
							},
						})
						wk.add({
							{
								mode = "v",
								buffer = args.buf,
								{ "<leader>cx", group = "extract" },
								{
									"<leader>cxm",
									[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
									desc = "Extract Method",
								},
								{
									"<leader>cxv",
									[[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
									desc = "Extract Variable",
								},
								{
									"<leader>cxc",
									[[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
									desc = "Extract Constant",
								},
							},
						})
					end
				end,
			})

			-- Avoid race condition by calling attach the first time, since the autocmd won't fire.
			attach_jdtls()
		end,
	},
}

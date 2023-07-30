-- whichkey
local wk = require("which-key")
local normal_keymap = {

	c = { "<cmd>TSContextToggle<cr>", "tree sitter context toggle" },

	r = { "<Cmd>luafile " .. os.getenv("HOME") .. "/.config/nvim/init.lua<cr>", "reload config" },

	-- lsp mappings
	l = {
		name = "+lsp",
		a = { vim.lsp.buf.code_action, "code action" },
		d = { "<Cmd>Telescope document_diagnostics<CR>", "document diagnostics" },
		D = { "<Cmd>Telescope workspace_diagnostics<CR>", "worskpace diagnostics" },
	},

	-- trouble
	x = {
		name = "+trouble",
		x = { "<cmd>Trouble<cr>", "trouble" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "workspace diagnostics" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "document diagnostics" },
		l = { "<cmd>Trouble loclist<cr>", "loclist" },
		q = { "<cmd>Trouble quickfix<cr>", "quickfix" },
		t = { "<cmd>TodoTrouble<cr>", "todo" },
	},

	g = {
		name = "+git",
		b = { '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', "blame" },
		g = { "<cmd>LazyGit<CR>", "lazygit" },
		f = { "<cmd>LazyGitFilterCurrentFile<CR>", "lazygit filter file" },
		p = { "<cmd>Gitsigns preview_hunk<CR>", "preview" },
		r = { "<cmd>Gitsigns reset_hunk<CR>", "reset" },
		s = { "<cmd>Gitsigns stage_hunk<CR>", "stage" },
	},

	t = {
		name = "+test",
		f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "file" },
		n = { "<cmd>lua require('neotest').run.run()<cr>", "nearest" },
		l = { "<cmd>lua require('neotest').run.run_last()<cr>", "last" },
		-- s = {" <cmd>lua require("neotest").run(vim.fn.getcwd())<CR>", "suite" }
		-- d = { "<cmd>lua require('neotest').run({strategy = 'dap'})<CR>", "with dap" },
		a = { "<cmd>lua require('neotest').run.attach()<CR>", "attach" },
		o = { "<cmd>lua require('neotest').output.open({ enter = true })<CR>", "output" },
		O = { "<cmd>lua require('neotest').output.open({enter = true, short = true})<CR>", "short output" },
		p = { "<cmd>lua require('neotest').summary.toggle()<CR>", "print summary" },
	},
}

wk.register(normal_keymap, { prefix = "<leader>" })

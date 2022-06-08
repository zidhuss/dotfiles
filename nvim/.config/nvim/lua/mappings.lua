-- map leader to space
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 1

vim.api.nvim_set_keymap("n", "<c-h>", "<Cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-j>", "<Cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-k>", "<Cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-l>", "<Cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-\\>", "<Cmd>TmuxNavigatePrevious<cr>", { noremap = true, silent = true })

-- faster saving
vim.api.nvim_set_keymap("n", "<c-s>", ":w<CR>", {})
vim.api.nvim_set_keymap("n", "<c-q>", ":q<CR>", {})
vim.api.nvim_set_keymap("i", "<c-s>", "<esc>:w<CR>", {})

vim.api.nvim_set_keymap("n", "<bs>", "<cmd>nohlsearch<CR>", {})

-- whichkey
local wk = require("which-key")
local normal_keymap = {

	["<CR>"] = { "<Cmd>Telescope find_files<CR>", "find files" },

	c = { "<cmd>TSContextToggle<cr>", "tree sitter context toggle" },

	r = { "<Cmd>luafile " .. os.getenv("HOME") .. "/.config/nvim/init.lua<cr>", "reload config" },

	p = { '"+p', "paste clipboard" },

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
		p = { "<cmd>Gitsigns preview_hunk<CR>", "preview" },
		r = { "<cmd>Gitsigns reset_hunk<CR>", "reset" },
		s = { "<cmd>Gitsigns stage_hunk<CR>", "stage" },
	},

	s = {
		name = "+search",
		b = { "<Cmd>Telescope buffers<CR>", "buffers" },
		h = { "<Cmd>Telescope help_tags<CR>", "help tags" },
		f = { "<Cmd>Telescope find_files<CR>", "files" },
		r = { "<Cmd>Telescope resume<CR>", "resume search" },
		s = { "<Cmd>Telescope live_grep<CR>", "search with grep" },
		t = { "<Cmd>Telescope treesitter<CR>", "treesitter symbols" },
		w = { "<Cmd>Telescope grep_string<CR>", "search word with grep" },
		c = {
			name = "+commands",
			c = { "<Cmd>Telescope commands<CR>", "commands" },
			h = { "<Cmd>Telescope command_history<CR>", "history" },
		},
		q = { "<Cmd>Telescope quickfix<CR>", "quickfix" },
		g = {
			name = "+git",
			g = { "<Cmd>Telescope git_commits<CR>", "commits" },
			c = { "<Cmd>Telescope git_bcommits<CR>", "bcommits" },
			b = { "<Cmd>Telescope git_branches<CR>", "branches" },
			s = { "<Cmd>Telescope git_status<CR>", "status" },
		},
	},

	f = {
		name = "+nvim-tree",
		t = { "<Cmd>NvimTreeToggle<cr>", "toggle" },
		f = { "<Cmd>NvimTreeFocus<cr>", "focus" },
	},

	t = {
		name = "+test",
		f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "file" },
		n = { "<cmd>lua require('neotest').run.run()<cr>", "nearest" },
		-- s = {" <cmd>lua require("neotest").run(vim.fn.getcwd())<CR>", "suite" }
		-- d = { "<cmd>lua require('neotest').run({strategy = 'dap'})<CR>", "with dap" },
		a = { "<cmd>lua require('neotest').run.attach()<CR>", "attach" },
		o = { "<cmd>lua require('neotest').output.open({ enter = true })<CR>", "output" },
		O = { "<cmd>lua require('neotest').output.open({enter = true, short = true})<CR>", "short output" },
		p = { "<cmd>lua require('neotest').summary.toggle()<CR>", "print summary" },
	},
}

local visual_keymap = { y = { '"+y', "yank clipboard" } }

wk.register(normal_keymap, { prefix = "<leader>" })
wk.register(visual_keymap, { mode = "v", prefix = "<leader>" })

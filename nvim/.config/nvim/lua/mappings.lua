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
}

wk.register(normal_keymap, { prefix = "<leader>" })

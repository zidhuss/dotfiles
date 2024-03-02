local gitsigns = require("gitsigns")

gitsigns.setup({

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "next git hunk" })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "prev git hunk" })

		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { desc = "blame line" })
		map("n", "<leader>gs", gs.stage_hunk, { desc = "stage hunk" })
		map("n", "<leader>gr", gs.reset_hunk, { desc = "reset hunk" })
		map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
	end,
})

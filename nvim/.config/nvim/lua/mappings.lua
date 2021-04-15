
-- map leader to space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 1

vim.api.nvim_set_keymap('n', '<c-h>', ':<Cmd>TmuxNavigateLeft<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<Cmd>TmuxNavigateDown<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', '<Cmd>TmuxNavigateUp<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', '<Cmd>TmuxNavigateRight<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-\\>', '<Cmd>TmuxNavigatePrevious<cr>', {noremap = true, silent = true})

-- faster saving
vim.api.nvim_set_keymap('n', '<c-s>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', '<c-q>', ':q<CR>', {})
vim.api.nvim_set_keymap('i', '<c-s>', '<esc>:w<CR>', {})

vim.api.nvim_set_keymap('n', '<bs>', '<cmd>nohlsearch<CR>', {})

-- whichkey
local wk = require('whichkey_setup')
local keymap = {

	['<CR>'] = {'<Cmd>Telescope find_files<CR>', 'find files'},

    r = { '<Cmd>luafile ' .. os.getenv('HOME') .. '/.config/nvim/init.lua<cr>', 'reload config' }, 

	p = {'"+p', 'paste clipboard'},
	y = {'"+y', 'yank clipboard'},

    -- lsp mappings
    l = {
		name = '+lsp',
        a = {'<Cmd>Lspsaga code_action<CR>', 'code action'},
        d = {'<Cmd>Telescope lsp_document_diagnostics<CR>', 'document diagnostics'},
        D = {'<Cmd>Telescope lsp_workspace_diagnostics<CR>', 'worskpace diagnostics'},
    },

	s = {
		name = '+search',
		b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
		h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
		f = {'<Cmd>Telescope find_files<CR>', 'files'},
		c = {
			name = '+commands',
			c = {'<Cmd>Telescope commands<CR>', 'commands'},
			h = {'<Cmd>Telescope command_history<CR>', 'history'},
		},
		q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
		g = {
			name = '+git',
			g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
			c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
			b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
			s = {'<Cmd>Telescope git_status<CR>', 'status'},
		},
	}
}

wk.register_keymap('leader', keymap)
